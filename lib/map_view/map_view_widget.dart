import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/candidate_profile_card/candidate_profile_card_widget.dart';
import '/components/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'map_view_model.dart';
export 'map_view_model.dart';

class MapViewWidget extends StatefulWidget {
  const MapViewWidget({super.key});

  @override
  State<MapViewWidget> createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends State<MapViewWidget> {
  late MapViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapViewModel());
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

    context.watch<FFAppState>();

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xFFF9FAFC),
            body: Center(
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
          );
        }
        List<UsersRecord> mapViewUsersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xFFF9FAFC),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Hero(
                tag: 'Logo',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/es_Logo.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primaryText,
                          icon: Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(
                              'SearchCandidates',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primaryText,
                          icon: Icon(
                            Icons.sort,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed(
                              'SearchCandidates',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/location.svg',
                        fit: BoxFit.cover,
                      ),
                      if (_model.showCandidatesChoiceValue != 'all')
                        FlutterFlowDropDown<String>(
                          controller: _model.stateDropdownValueController ??=
                              FormFieldController<String>(
                            _model.stateDropdownValue ??= 'Tamil Nadu',
                          ),
                          options: const [
                            'Tamil Nadu',
                            'Andhra Pradesh',
                            'Kerela',
                            'Telengana',
                            'Maharashtra'
                          ],
                          onChanged: (val) =>
                              setState(() => _model.stateDropdownValue = val),
                          width: 150.0,
                          height: 35.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Sora',
                                    fontSize: 14.0,
                                  ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 15.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 0.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Tamil Nadu, IN',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Sora',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ]
                        .addToStart(const SizedBox(width: 20.0))
                        .addToEnd(const SizedBox(width: 20.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Text(
                                'Show Candidates',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model
                                        .showCandidatesChoiceValueController ??=
                                    FormFieldController<String>(
                                  _model.showCandidatesChoiceValue ??= 'all',
                                ),
                                options: List<String>.from(['all', 'matched']),
                                optionLabels: const ['View All', 'Matched'],
                                onChanged: (val) => setState(() =>
                                    _model.showCandidatesChoiceValue = val),
                                width: 120.0,
                                height: 31.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      fontSize: 14.0,
                                    ),
                                hintText: 'Candidates',
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 15.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context).accent3,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 20.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Text(
                                'Education Level',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.educationLevelValueController ??=
                                        FormFieldController<String>(null),
                                options: List<String>.from(
                                    ['ug', 'pg', 'doc', 'all']),
                                optionLabels: const ['UG', 'PG', 'DOC', 'All'],
                                onChanged: (val) => setState(
                                    () => _model.educationLevelValue = val),
                                width: 120.0,
                                height: 31.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      fontSize: 14.0,
                                    ),
                                hintText: 'Edu Level',
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 15.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context).accent3,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 20.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Text(
                                'Gender',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                multiSelectController:
                                    _model.genderValueController ??=
                                        FormFieldController<List<String>>(null),
                                options: functions.enumGenderToStringList(
                                    Gender.values.toList()),
                                width: 110.0,
                                height: 31.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      fontSize: 14.0,
                                    ),
                                hintText: 'Gender',
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 15.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context).accent3,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 20.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: true,
                                onMultiSelectChanged: (val) async {
                                  setState(() => _model.genderValue = val);
                                  context.pushNamed(
                                    'mapView',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Text(
                                'Experience(Min - Max in yrs)',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Sora',
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.experienceFromValueController ??=
                                            FormFieldController<String>(null),
                                    options: List<String>.from(<String>[]),
                                    optionLabels: const <String>[],
                                    onChanged: (val) => setState(
                                        () => _model.experienceFromValue = val),
                                    width: 90.0,
                                    height: 31.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Sora',
                                          fontSize: 14.0,
                                        ),
                                    hintText: '0',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 15.0,
                                    ),
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent3,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 20.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                                Text(
                                  ' - ',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.experienceTillValueController ??=
                                            FormFieldController<String>(
                                      _model.experienceTillValue ??= '',
                                    ),
                                    options: List<String>.from(<String>[]),
                                    optionLabels: const <String>[],
                                    onChanged: (val) => setState(
                                        () => _model.experienceTillValue = val),
                                    width: 90.0,
                                    height: 31.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Sora',
                                          fontSize: 14.0,
                                        ),
                                    hintText: '0',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 15.0,
                                    ),
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent3,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 20.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]
                          .addToStart(const SizedBox(width: 20.0))
                          .addToEnd(const SizedBox(width: 20.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Text(
                    'Candidate Map',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (true) {
                        return Stack(
                          children: [
                            Builder(
                              builder: (context) => SizedBox(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: custom_widgets.CustomMap(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  initialCenter: mapViewUsersRecordList
                                      .first.address.latLang!,
                                  userDocs: mapViewUsersRecordList,
                                  onMarkerTap: (userDoc) async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: CandidateProfileCardWidget(
                                              userRef: userDoc.reference,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  updateCandidateList: (candidateList) async {
                                    setState(() {
                                      _model.candidateList = candidateList
                                          .toList()
                                          .cast<UsersRecord>();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Builder(
                                  builder: (context) {
                                    final candidate =
                                        _model.candidateList.toList();
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(candidate.length,
                                              (candidateIndex) {
                                        final candidateItem =
                                            candidate[candidateIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {},
                                          child: Container(
                                            width: 208.0,
                                            constraints: const BoxConstraints(
                                              minHeight: 180.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: const Color(0xFFCFD9DE),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    candidateItem.displayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/images/cap.svg',
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Expanded(
                                                          child: Builder(
                                                            builder: (context) {
                                                              final education =
                                                                  candidateItem
                                                                      .education
                                                                      .toList();
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    education
                                                                        .length,
                                                                    (educationIndex) {
                                                                  final educationItem =
                                                                      education[
                                                                          educationIndex];
                                                                  return Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      educationItem
                                                                          .educationType,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Sora',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ),
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
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
                                                              '${candidateItem.address.city} ${candidateItem.address.state}',
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
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 7.0,
                                                                0.0, 7.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          constraints:
                                                              const BoxConstraints(
                                                            minWidth: 63.0,
                                                            minHeight: 30.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent3,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                candidateItem
                                                                    .gender!
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Sora',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            constraints:
                                                                const BoxConstraints(
                                                              minWidth: 63.0,
                                                              minHeight: 30.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          Text(
                                                                    'Age ${functions.dateStringAgeCalculator(currentUserDocument!.dob!.toString()).toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Sora',
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.alldocs =
                                                              await queryChatsRecordOnce(
                                                            queryBuilder:
                                                                (chatsRecord) =>
                                                                    chatsRecord
                                                                        .where(
                                                              'users',
                                                              arrayContains:
                                                                  getChatUserFirestoreData(
                                                                ChatUserStruct(
                                                                  userRef:
                                                                      currentUserReference,
                                                                  userName:
                                                                      currentUserDisplayName,
                                                                  userEmail:
                                                                      currentUserEmail,
                                                                ),
                                                                true,
                                                              ),
                                                            ),
                                                          );
                                                          if (_model.alldocs!
                                                              .where((e) => e
                                                                  .users
                                                                  .where((e) =>
                                                                      e.userRef ==
                                                                      candidateItem
                                                                          .reference)
                                                                  .toList()
                                                                  .isNotEmpty)
                                                              .toList()
                                                              .isNotEmpty) {
                                                            context.pushNamed(
                                                              'chatMessages',
                                                              queryParameters: {
                                                                'chatDoc':
                                                                    serializeParam(
                                                                  _model.alldocs
                                                                      ?.where((e) => e
                                                                          .users
                                                                          .where((e) =>
                                                                              e.userRef ==
                                                                              candidateItem.reference)
                                                                          .toList()
                                                                          .isNotEmpty)
                                                                      .toList()
                                                                      .first
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            var chatsRecordReference =
                                                                ChatsRecord
                                                                    .collection
                                                                    .doc();
                                                            await chatsRecordReference
                                                                .set({
                                                              ...mapToFirestore(
                                                                {
                                                                  'users': [
                                                                    getChatUserFirestoreData(
                                                                      createChatUserStruct(
                                                                        userRef:
                                                                            currentUserReference,
                                                                        userName:
                                                                            currentUserDisplayName,
                                                                        userEmail:
                                                                            currentUserEmail,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ],
                                                                },
                                                              ),
                                                            });
                                                            _model.createdChat =
                                                                ChatsRecord
                                                                    .getDocumentFromData({
                                                              ...mapToFirestore(
                                                                {
                                                                  'users': [
                                                                    getChatUserFirestoreData(
                                                                      createChatUserStruct(
                                                                        userRef:
                                                                            currentUserReference,
                                                                        userName:
                                                                            currentUserDisplayName,
                                                                        userEmail:
                                                                            currentUserEmail,
                                                                        clearUnsetFields:
                                                                            false,
                                                                        create:
                                                                            true,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ],
                                                                },
                                                              ),
                                                            }, chatsRecordReference);

                                                            await _model
                                                                .createdChat!
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'users':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getChatUserFirestoreData(
                                                                      updateChatUserStruct(
                                                                        ChatUserStruct(
                                                                          userRef:
                                                                              candidateItem.reference,
                                                                          userName:
                                                                              candidateItem.displayName,
                                                                          userEmail:
                                                                              candidateItem.email,
                                                                        ),
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                },
                                                              ),
                                                            });

                                                            context.pushNamed(
                                                              'chatMessages',
                                                              queryParameters: {
                                                                'chatDoc':
                                                                    serializeParam(
                                                                  _model
                                                                      .createdChat
                                                                      ?.reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }

                                                          setState(() {});
                                                        },
                                                        text: 'Send Message',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 35.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Sora',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                          .divide(const SizedBox(width: 10.0))
                                          .addToStart(const SizedBox(width: 20.0))
                                          .addToEnd(const SizedBox(width: 20.0)),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return FlutterFlowGoogleMap(
                          controller: _model.doNotDeletesController,
                          onCameraIdle: (latLng) =>
                              _model.doNotDeletesCenter = latLng,
                          initialLocation: _model.doNotDeletesCenter ??=
                              const LatLng(13.106061, -59.613158),
                          markerColor: GoogleMarkerColor.violet,
                          mapType: MapType.normal,
                          style: GoogleMapStyle.standard,
                          initialZoom: 14.0,
                          allowInteraction: true,
                          allowZoom: true,
                          showZoomControls: true,
                          showLocation: true,
                          showCompass: false,
                          showMapToolbar: false,
                          showTraffic: false,
                          centerMapOnMarkerTap: true,
                        );
                      }
                    },
                  ),
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
              ].addToStart(const SizedBox(height: 12.0)),
            ),
          ),
        );
      },
    );
  }
}
