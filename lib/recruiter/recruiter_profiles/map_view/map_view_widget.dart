import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'map_view_model.dart';
export 'map_view_model.dart';

class MapViewWidget extends StatefulWidget {
  const MapViewWidget({
    super.key,
    this.gender,
  });

  final String? gender;

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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

    return Title(
        title: 'mapView',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF9FAFC),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/es_Logo.svg',
                  fit: BoxFit.contain,
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/location.svg',
                                                fit: BoxFit.cover,
                                              ),
                                              if (_model
                                                      .showCandidatesChoiceValue !=
                                                  'all')
                                                FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .stateDropdownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.stateDropdownValue ??=
                                                        'Tamil Nadu',
                                                  ),
                                                  options: const [
                                                    'Tamil Nadu',
                                                    'Andhra Pradesh',
                                                    'Kerela',
                                                    'Telengana',
                                                    'Maharashtra'
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .stateDropdownValue =
                                                          val),
                                                  width: 150.0,
                                                  height: 35.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Sora',
                                                            fontSize: 14.0,
                                                          ),
                                                  icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: 15.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 0.0,
                                                  margin: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 4.0, 12.0, 4.0),
                                                  hidesUnderline: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'Tamil Nadu, IN',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Sora',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          'Show Candidates',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sora',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .showCandidatesChoiceValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.showCandidatesChoiceValue ??=
                                                                'all',
                                                          ),
                                                          options: List<
                                                              String>.from([
                                                            'all',
                                                            'matched'
                                                          ]),
                                                          optionLabels: const [
                                                            'View All',
                                                            'Matched'
                                                          ],
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.showCandidatesChoiceValue =
                                                                      val),
                                                          width: 120.0,
                                                          height: 31.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Sora',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                          hintText:
                                                              'Candidates',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 15.0,
                                                          ),
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent3,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 20.0,
                                                          margin:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          'Education Level',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sora',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .educationLevelValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: List<
                                                              String>.from([
                                                            'ug',
                                                            'pg',
                                                            'doc',
                                                            'all'
                                                          ]),
                                                          optionLabels: const [
                                                            'UG',
                                                            'PG',
                                                            'DOC',
                                                            'All'
                                                          ],
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.educationLevelValue =
                                                                      val),
                                                          width: 120.0,
                                                          height: 31.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Sora',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                          hintText: 'Edu Level',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 15.0,
                                                          ),
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent3,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 20.0,
                                                          margin:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          'Gender',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sora',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .genderValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.genderValue ??=
                                                                'All',
                                                          ),
                                                          options: const [
                                                            'All',
                                                            'Male',
                                                            'Female',
                                                            'Neutral'
                                                          ],
                                                          onChanged:
                                                              (val) async {
                                                            setState(() => _model
                                                                    .genderValue =
                                                                val);
                                                            context.pushNamed(
                                                              'mapView',
                                                              queryParameters: {
                                                                'gender':
                                                                    serializeParam(
                                                                  _model
                                                                      .genderValue,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    const TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          width: 110.0,
                                                          height: 31.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Sora',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                          hintText: 'Gender',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 15.0,
                                                          ),
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent3,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 20.0,
                                                          margin:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          'Experience(Min - Max in yrs)',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sora',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .experienceFromValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: List<
                                                                      String>.from(
                                                                  <String>[]),
                                                              optionLabels: const <String>[],
                                                              onChanged: (val) =>
                                                                  setState(() =>
                                                                      _model.experienceFromValue =
                                                                          val),
                                                              width: 90.0,
                                                              height: 31.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Sora',
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                              hintText: '0',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 15.0,
                                                              ),
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius:
                                                                  20.0,
                                                              margin:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                          Text(
                                                            ' - ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .experienceTillValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.experienceTillValue ??=
                                                                    '',
                                                              ),
                                                              options: List<
                                                                      String>.from(
                                                                  <String>[]),
                                                              optionLabels: const <String>[],
                                                              onChanged: (val) =>
                                                                  setState(() =>
                                                                      _model.experienceTillValue =
                                                                          val),
                                                              width: 90.0,
                                                              height: 31.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Sora',
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                              hintText: '0',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 15.0,
                                                              ),
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius:
                                                                  20.0,
                                                              margin:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Candidate Map',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Expanded(
                                child: StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRecord> customMapUsersRecordList =
                                        snapshot.data!
                                            .where(
                                                (u) => u.uid != currentUserUid)
                                            .toList();
                                    return SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: custom_widgets.CustomMap(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        initialCenter: customMapUsersRecordList
                                            .first.address.latLang!,
                                        lantlangs: customMapUsersRecordList
                                            .map((e) => e.address.latLang)
                                            .withoutNulls
                                            .toList(),
                                        userDoc: customMapUsersRecordList,
                                        openUserDetails: () async {},
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}