import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/filter/filter_widget.dart';
import '/components/loading/loading_widget.dart';
import '/components/navigation/navigation_widget.dart';
import '/components/send_email_message/send_email_message_widget.dart';
import '/components/send_message/send_message_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:text_search/text_search.dart';
import 'list_candidates_model.dart';
export 'list_candidates_model.dart';

class ListCandidatesWidget extends StatefulWidget {
  const ListCandidatesWidget({
    super.key,
    String? jobType,
    String? educationType,
    String? educationDegree,
    String? educationSubject,
    int? workExperienceFrom,
    int? workExperienceTo,
    int? monthlySalaryRangeFrom,
    int? monthlySalaryRangeTo,
    bool? filtered,
  })  : jobType = jobType ?? '',
        educationType = educationType ?? '',
        educationDegree = educationDegree ?? '',
        educationSubject = educationSubject ?? '',
        workExperienceFrom = workExperienceFrom ?? 0,
        workExperienceTo = workExperienceTo ?? 9999,
        monthlySalaryRangeFrom = monthlySalaryRangeFrom ?? 0,
        monthlySalaryRangeTo = monthlySalaryRangeTo ?? 9999999,
        filtered = filtered ?? false;

  final String jobType;
  final String educationType;
  final String educationDegree;
  final String educationSubject;
  final int workExperienceFrom;
  final int workExperienceTo;
  final int monthlySalaryRangeFrom;
  final int monthlySalaryRangeTo;
  final bool filtered;

  @override
  State<ListCandidatesWidget> createState() => _ListCandidatesWidgetState();
}

class _ListCandidatesWidgetState extends State<ListCandidatesWidget> {
  late ListCandidatesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListCandidatesModel());

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
    _model.textFieldFocusNode ??= FocusNode();
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
          preferredSize: const Size.fromHeight(100.0),
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
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  const Duration(milliseconds: 2000),
                  () async {
                    await queryUsersRecordOnce()
                        .then(
                          (records) => _model.simpleSearchResults = TextSearch(
                            records
                                .map(
                                  (record) => TextSearchItem.fromTerms(
                                      record, [record.email]),
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
                textCapitalization: TextCapitalization.words,
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
                  suffixIcon: _model.textController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            _model.textController?.clear();
                            await queryUsersRecordOnce()
                                .then(
                                  (records) => _model.simpleSearchResults =
                                      TextSearch(
                                    records
                                        .map(
                                          (record) => TextSearchItem.fromTerms(
                                              record, [record.email]),
                                        )
                                        .toList(),
                                  )
                                          .search(_model.textController.text)
                                          .map((r) => r.object)
                                          .toList(),
                                )
                                .onError(
                                    (_, __) => _model.simpleSearchResults = [])
                                .whenComplete(() => setState(() {}));

                            setState(() {});
                          },
                          child: Icon(
                            Icons.clear,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
            actions: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) => Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showDialog(
                          barrierColor: const Color(0x4E000000),
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: const FilterWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: SvgPicture.asset(
                        'assets/images/setting-4_(1).svg',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
            if (_model.selectedCandidate.isNotEmpty)
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        _model.selectedCandidate = [];
                      });
                    },
                    text:
                        '${_model.selectedCandidate.length.toString()} Selected',
                    icon: const Icon(
                      Icons.check_circle,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: 147.0,
                      height: 37.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).tertiary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Sora',
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (widget.filtered) {
                    return StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord
                            .where(
                              'seeking_job_type',
                              isEqualTo:
                                  widget.jobType != '' ? widget.jobType : null,
                            )
                            .where(
                              'education.educationType',
                              isEqualTo: widget.educationType != ''
                                  ? widget.educationType
                                  : null,
                            )
                            .where(
                              'education.degree',
                              isEqualTo: widget.educationDegree != ''
                                  ? widget.educationDegree
                                  : null,
                            )
                            .where(
                              'education.subject',
                              isEqualTo: widget.educationSubject != ''
                                  ? widget.educationSubject
                                  : null,
                            )
                            .where(
                              'salary_range.from',
                              isGreaterThanOrEqualTo:
                                  widget.monthlySalaryRangeFrom,
                            ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> listViewUsersRecordList =
                            snapshot.data!;
                        if (listViewUsersRecordList.isEmpty) {
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
                          itemCount: listViewUsersRecordList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewUsersRecord =
                                listViewUsersRecordList[listViewIndex];
                            return Visibility(
                              visible: (widget.monthlySalaryRangeTo >=
                                      listViewUsersRecord.salaryRange.to) &&
                                  (listViewUsersRecord.workExperienceHistory
                                      .where((e) =>
                                          (functions.calculateNumberOfYears(
                                                  e.duration) >=
                                              widget.workExperienceFrom) &&
                                          (functions.calculateNumberOfYears(
                                                  e.duration) <=
                                              widget.workExperienceTo))
                                      .toList()
                                      .isNotEmpty),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'detailedprofilecandidate',
                                    queryParameters: {
                                      'candidateProfile': serializeParam(
                                        listViewUsersRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            listViewUsersRecord.photoUrl,
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (listViewUsersRecord
                                                            .displayName !=
                                                        '')
                                                  Text(
                                                    valueOrDefault<String>(
                                                      listViewUsersRecord
                                                          .displayName,
                                                      'TEXT',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/cap.svg',
                                                        fit: BoxFit.cover,
                                                      ),
                                                      if (false)
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${valueOrDefault<String>(
                                                                listViewUsersRecord
                                                                    .education
                                                                    .where((e) =>
                                                                        e.primary)
                                                                    .toList()
                                                                    .first
                                                                    .educationType,
                                                                'TEXT',
                                                              )} ${valueOrDefault<String>(
                                                                listViewUsersRecord
                                                                    .education
                                                                    .where((e) =>
                                                                        e.primary)
                                                                    .toList()
                                                                    .first
                                                                    .degree,
                                                                'TEXT',
                                                              )} ${valueOrDefault<String>(
                                                                listViewUsersRecord
                                                                    .education
                                                                    .where((e) =>
                                                                        e.primary)
                                                                    .toList()
                                                                    .first
                                                                    .subject,
                                                                'TEXT',
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Sora',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/Location1.svg',
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '${valueOrDefault<String>(
                                                              listViewUsersRecord
                                                                  .address
                                                                  .city,
                                                              'TEXT',
                                                            )} ${valueOrDefault<String>(
                                                              listViewUsersRecord
                                                                  .address
                                                                  .state,
                                                              'TEXT',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
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
                                              () => _model.selectedCandidate
                                                      .contains(
                                                          listViewUsersRecord
                                                              .reference)
                                                  ? _model
                                                      .removeFromSelectedCandidate(
                                                          listViewUsersRecord
                                                              .reference)
                                                  : _model
                                                      .addToSelectedCandidate(
                                                          listViewUsersRecord
                                                              .reference),
                                            );
                                          },
                                          value: _model.selectedCandidate
                                              .contains(listViewUsersRecord
                                                  .reference),
                                          onIcon: Icon(
                                            Icons.check_circle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 25.0,
                                          ),
                                          offIcon: Icon(
                                            Icons.check_circle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 25.0,
                                          ),
                                        ),
                                      ]
                                          .addToStart(const SizedBox(width: 20.0))
                                          .addToEnd(const SizedBox(width: 20.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    functions.enumToString(
                                                        listViewUsersRecord
                                                            .gender!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                  ),
                                                ),
                                                child: Visibility(
                                                  visible:
                                                      listViewUsersRecord.dob !=
                                                          null,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Age ${functions.dateStringAgeCalculator(listViewUsersRecord.dob!.toString()).toString()}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Sora',
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                  ),
                                                ),
                                                child: Visibility(
                                                  visible: listViewUsersRecord
                                                          .salaryRange !=
                                                      null,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      '${formatNumber(
                                                        listViewUsersRecord
                                                            .salaryRange.from,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                        currency: '₹',
                                                      )} - ${formatNumber(
                                                        listViewUsersRecord
                                                            .salaryRange.to,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                        currency: '₹',
                                                      )}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Sora',
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 0.0),
                                            child: ToggleIcon(
                                              onPressed: () async {
                                                setState(
                                                  () => _model.savedCandidates
                                                          .contains(
                                                              listViewUsersRecord
                                                                  .reference)
                                                      ? _model
                                                          .removeFromSavedCandidates(
                                                              listViewUsersRecord
                                                                  .reference)
                                                      : _model
                                                          .addToSavedCandidates(
                                                              listViewUsersRecord
                                                                  .reference),
                                                );
                                                if ((currentUserDocument
                                                            ?.savedCandidates
                                                            .toList() ??
                                                        [])
                                                    .contains(
                                                        listViewUsersRecord
                                                            .reference)) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'savedCandidates':
                                                            FieldValue
                                                                .arrayRemove([
                                                          listViewUsersRecord
                                                              .reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'savedCandidates':
                                                            FieldValue
                                                                .arrayUnion([
                                                          listViewUsersRecord
                                                              .reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              value: _model.savedCandidates
                                                  .contains(listViewUsersRecord
                                                      .reference),
                                              onIcon: Icon(
                                                Icons.favorite_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 25.0,
                                              ),
                                              offIcon: Icon(
                                                Icons.favorite_border_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 12.0))
                                      .addToStart(const SizedBox(height: 12.0)),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (_model.textController.text != '') {
                    return Builder(
                      builder: (context) {
                        final searchresult =
                            _model.simpleSearchResults.toList();
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
                            final searchresultItem =
                                searchresult[searchresultIndex];
                            return Visibility(
                              visible: (widget.monthlySalaryRangeTo == null) ||
                                  ((int.tryParse(widget.monthlySalaryRangeTo
                                          .toString()))! <=
                                      searchresultItem.salaryRange.to) ||
                                  (searchresultItem.profileType ==
                                      ProfileType.Candidate),
                              child: InkWell(
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  searchresultItem.displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/cap.svg',
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '${searchresultItem.education.where((e) => e.primary).toList().first.educationType} ${searchresultItem.education.where((e) => e.primary).toList().first.degree} ${searchresultItem.education.where((e) => e.primary).toList().first.subject}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/Location1.svg',
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '${searchresultItem.address.city} ${searchresultItem.address.state}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
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
                                              () => _model.selectedCandidate
                                                      .contains(searchresultItem
                                                          .reference)
                                                  ? _model
                                                      .removeFromSelectedCandidate(
                                                          searchresultItem
                                                              .reference)
                                                  : _model
                                                      .addToSelectedCandidate(
                                                          searchresultItem
                                                              .reference),
                                            );
                                          },
                                          value: _model.selectedCandidate
                                              .contains(
                                                  searchresultItem.reference),
                                          onIcon: Icon(
                                            Icons.check_circle,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 25.0,
                                          ),
                                          offIcon: Icon(
                                            Icons.check_circle_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 25.0,
                                          ),
                                        ),
                                      ]
                                          .addToStart(const SizedBox(width: 20.0))
                                          .addToEnd(const SizedBox(width: 20.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    functions.enumToString(
                                                        searchresultItem
                                                            .gender!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Age ${functions.dateStringAgeCalculator(searchresultItem.dob!.toString()).toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    '₹${searchresultItem.salaryRange.from.toString()}-  ₹ ${searchresultItem.salaryRange.to.toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 0.0),
                                            child: ToggleIcon(
                                              onPressed: () async {
                                                setState(() => _model.filtered =
                                                    !_model.filtered);
                                                if ((currentUserDocument
                                                            ?.savedCandidates
                                                            .toList() ??
                                                        [])
                                                    .contains(searchresultItem
                                                        .reference)) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'savedCandidates':
                                                            FieldValue
                                                                .arrayRemove([
                                                          searchresultItem
                                                              .reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'savedCandidates':
                                                            FieldValue
                                                                .arrayUnion([
                                                          searchresultItem
                                                              .reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              value: _model.filtered,
                                              onIcon: Icon(
                                                Icons.favorite_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 25.0,
                                              ),
                                              offIcon: Icon(
                                                Icons.favorite_border_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 12.0))
                                      .addToStart(const SizedBox(height: 12.0)),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return PagedListView<DocumentSnapshot<Object?>?,
                        UsersRecord>.separated(
                      pagingController: _model.setListViewController3(
                        UsersRecord.collection.where(
                          'profile_type',
                          isEqualTo: ProfileType.Candidate.serialize(),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        20.0,
                        0,
                        20.0,
                      ),
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                      builderDelegate: PagedChildBuilderDelegate<UsersRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, listViewIndex) {
                          final listViewUsersRecord = _model
                              .listViewPagingController3!
                              .itemList![listViewIndex];
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
                                    listViewUsersRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                listViewUsersRecord.photoUrl,
                                                fit: BoxFit.contain,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              allowRotation: false,
                                              tag: listViewUsersRecord.photoUrl,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: listViewUsersRecord.photoUrl,
                                        transitionOnUserGestures: true,
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            listViewUsersRecord.photoUrl,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
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
                                              listViewUsersRecord.displayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${valueOrDefault<String>(
                                                          listViewUsersRecord
                                                              .education
                                                              .where((e) =>
                                                                  e.primary)
                                                              .toList()
                                                              .first
                                                              .educationType,
                                                          'No Education',
                                                        )} ${valueOrDefault<String>(
                                                          listViewUsersRecord
                                                              .education
                                                              .where((e) =>
                                                                  e.primary)
                                                              .toList()
                                                              .first
                                                              .degree,
                                                          'No Education Degree',
                                                        )} ${valueOrDefault<String>(
                                                          listViewUsersRecord
                                                              .education
                                                              .where((e) =>
                                                                  e.primary)
                                                              .toList()
                                                              .first
                                                              .subject,
                                                          'No Education Subject',
                                                        )}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${listViewUsersRecord.address.city} ${listViewUsersRecord.address.state}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
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
                                          () => _model.selectedCandidate
                                                  .contains(listViewUsersRecord
                                                      .reference)
                                              ? _model
                                                  .removeFromSelectedCandidate(
                                                      listViewUsersRecord
                                                          .reference)
                                              : _model.addToSelectedCandidate(
                                                  listViewUsersRecord
                                                      .reference),
                                        );
                                      },
                                      value: _model.selectedCandidate.contains(
                                          listViewUsersRecord.reference),
                                      onIcon: Icon(
                                        Icons.check_circle,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 25.0,
                                      ),
                                      offIcon: Icon(
                                        Icons.check_circle,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 25.0,
                                      ),
                                    ),
                                  ]
                                      .addToStart(const SizedBox(width: 20.0))
                                      .addToEnd(const SizedBox(width: 20.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                functions.enumToString(
                                                    listViewUsersRecord
                                                        .gender!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Age ${functions.dateStringAgeCalculator(listViewUsersRecord.dob!.toString()).toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                ' ${formatNumber(
                                                  listViewUsersRecord
                                                      .salaryRange.from,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '₹',
                                                )}-  ${formatNumber(
                                                  listViewUsersRecord
                                                      .salaryRange.to,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '₹',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: ToggleIcon(
                                          onPressed: () async {
                                            setState(
                                              () => _model
                                                      .savedCandidates
                                                      .contains(
                                                          listViewUsersRecord
                                                              .reference)
                                                  ? _model
                                                      .removeFromSavedCandidates(
                                                          listViewUsersRecord
                                                              .reference)
                                                  : _model.addToSavedCandidates(
                                                      listViewUsersRecord
                                                          .reference),
                                            );
                                            if ((currentUserDocument
                                                        ?.savedCandidates
                                                        .toList() ??
                                                    [])
                                                .contains(listViewUsersRecord
                                                    .reference)) {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'savedCandidates':
                                                        FieldValue.arrayRemove([
                                                      listViewUsersRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'savedCandidates':
                                                        FieldValue.arrayUnion([
                                                      listViewUsersRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            }
                                          },
                                          value: _model.savedCandidates
                                              .contains(listViewUsersRecord
                                                  .reference),
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
                                  .divide(const SizedBox(height: 8.0))
                                  .addToStart(const SizedBox(height: 8.0)),
                            ),
                          );
                        },
                      ),
                    );
                  }
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
                                    candidateList: _model.selectedCandidate,
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
                search: true,
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
