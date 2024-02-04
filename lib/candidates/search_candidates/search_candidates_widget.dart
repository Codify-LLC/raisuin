import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading/loading_widget.dart';
import '/components/navigation/navigation_widget.dart';
import '/components/send_email_message/send_email_message_widget.dart';
import '/components/send_message/send_message_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:text_search/text_search.dart';
import 'search_candidates_model.dart';
export 'search_candidates_model.dart';

class SearchCandidatesWidget extends StatefulWidget {
  const SearchCandidatesWidget({super.key});

  @override
  State<SearchCandidatesWidget> createState() => _SearchCandidatesWidgetState();
}

class _SearchCandidatesWidgetState extends State<SearchCandidatesWidget> {
  late SearchCandidatesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchCandidatesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.savedCandidates =
            (currentUserDocument?.savedCandidates.toList() ?? [])
                .toList()
                .cast<DocumentReference>();
      });
    });

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF9FAFC),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('homePage');
              },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
            ),
            title: SizedBox(
              width: MediaQuery.sizeOf(context).width * 1.0,
              child: Autocomplete<String>(
                initialValue: const TextEditingValue(),
                optionsBuilder: (textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _model.simpleSearchResults
                      .map((e) => e.displayName)
                      .toList()
                      .where((option) {
                    final lowercaseOption = option.toLowerCase();
                    return lowercaseOption
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return AutocompleteOptionsList(
                    textFieldKey: _model.textFieldKey,
                    textController: _model.textController!,
                    options: options.toList(),
                    onSelected: onSelected,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    textHighlightStyle: const TextStyle(),
                    elevation: 4.0,
                    optionBackgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    optionHighlightColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    maxHeight: 200.0,
                  );
                },
                onSelected: (String selection) {
                  setState(() => _model.textFieldSelectedOption = selection);
                  FocusScope.of(context).unfocus();
                },
                fieldViewBuilder: (
                  context,
                  textEditingController,
                  focusNode,
                  onEditingComplete,
                ) {
                  _model.textFieldFocusNode = focusNode;

                  _model.textController = textEditingController;
                  return TextFormField(
                    key: _model.textFieldKey,
                    controller: textEditingController,
                    focusNode: focusNode,
                    onEditingComplete: onEditingComplete,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      const Duration(milliseconds: 2000),
                      () async {
                        await queryUsersRecordOnce()
                            .then(
                              (records) => _model.simpleSearchResults =
                                  TextSearch(
                                records
                                    .map(
                                      (record) =>
                                          TextSearchItem.fromTerms(record, [
                                        record.maritalStatus,
                                        record.expriencedIn,
                                        record.gender,
                                        record.seekingJobType,
                                        record.phoneNumber,
                                        record.displayName,
                                        record.email]),
                                    )
                                    .toList(),
                              )
                                      .search(_model.textController.text)
                                      .map((r) => r.object)
                                      .toList(),
                            )
                            .onError((_, __) => _model.simpleSearchResults = [])
                            .whenComplete(() => setState(() {}));
                      },
                    ),
                    autofocus: true,
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.search,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: FlutterFlowTheme.of(context).bodySmall,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).accent4,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  );
                },
              ),
            ),
            actions: const [],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: Container(),
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Builder(
                builder: (context) {
                  final searchresult = _model.simpleSearchResults.toList();
                  if (searchresult.isEmpty) {
                    return const LoadingWidget();
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      20.0,
                      0,
                      20.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: searchresult.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                    itemBuilder: (context, searchresultIndex) {
                      final searchresultItem = searchresult[searchresultIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'detailedprofilecandidate',
                            queryParameters: {
                              'candidateProfile': serializeParam(
                                searchresultItem.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      searchresultItem.photoUrl,
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvrcBgUuK4kTumtb_R2jjtcDcalBuGrqXsmrQNX_wUXA&s',
                                    ),
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          searchresultItem.displayName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/cap.svg',
                                                fit: BoxFit.cover,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '${searchresultItem.education.where((e) => e.primary).toList().first.educationType} ${searchresultItem.education.where((e) => e.primary).toList().first.degree} ${searchresultItem.education.where((e) => e.primary).toList().first.subject}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/Location1.svg',
                                                fit: BoxFit.cover,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '${searchresultItem.address.city} ${searchresultItem.address.state}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ToggleIcon(
                                  onPressed: () async {
                                    setState(
                                      () => _model.selectedCandidate.contains(
                                              searchresultItem.reference)
                                          ? _model.removeFromSelectedCandidate(
                                              searchresultItem.reference)
                                          : _model.addToSelectedCandidate(
                                              searchresultItem.reference),
                                    );
                                  },
                                  value: _model.selectedCandidate
                                      .contains(searchresultItem.reference),
                                  onIcon: Icon(
                                    Icons.check_circle,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 25.0,
                                  ),
                                  offIcon: Icon(
                                    Icons.radio_button_off_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 25.0,
                                  ),
                                ),
                              ]
                                  .addToStart(const SizedBox(width: 20.0))
                                  .addToEnd(const SizedBox(width: 20.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            searchresultItem.gender,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Sora',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Age ${functions.dateStringAgeCalculator(searchresultItem.dob!.toString()).toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Sora',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '₹${searchresultItem.salaryRange.from.toString()}-  ₹ ${searchresultItem.salaryRange.to.toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Sora',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: ToggleIcon(
                                      onPressed: () async {
                                        setState(() =>
                                            _model.filtered = !_model.filtered);
                                        if ((currentUserDocument
                                                    ?.savedCandidates
                                                    .toList() ??
                                                [])
                                            .contains(
                                                searchresultItem.reference)) {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'savedCandidates':
                                                    FieldValue.arrayRemove([
                                                  searchresultItem.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        } else {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'savedCandidates':
                                                    FieldValue.arrayUnion([
                                                  searchresultItem.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        }
                                      },
                                      value: _model.filtered,
                                      onIcon: Icon(
                                        Icons.favorite_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 25.0,
                                      ),
                                      offIcon: Icon(
                                        Icons.favorite_border_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                                  .addToStart(const SizedBox(width: 20.0))
                                  .addToEnd(const SizedBox(width: 20.0)),
                            ),
                            Divider(
                              height: 1.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent3,
                            ),
                          ]
                              .divide(const SizedBox(height: 12.0))
                              .addToStart(const SizedBox(height: 12.0)),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            if (_model.selectedCandidate.isNotEmpty)
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent3,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SendMessageWidget(
                                    candidateList: _model.selectedCandidate,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: 'Send Message',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Sora',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SendEmailMessageWidget(
                                    candidateList: _model.savedCandidates,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: 'Send Mail',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.336,
                          height: 47.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Sora',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                    ],
                  ),
                ].divide(const SizedBox(height: 8.0)).addToEnd(const SizedBox(height: 8.0)),
              ),
            wrapWithModel(
              model: _model.navigationModel,
              updateCallback: () => setState(() {}),
              child: const NavigationWidget(
                home: false,
                search: false,
                ads: false,
                messages: false,
                accounts: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
