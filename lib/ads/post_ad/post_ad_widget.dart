import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/sqaure_choice_chips_widget.dart';
import '/components/upload_ad_image_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'post_ad_model.dart';
export 'post_ad_model.dart';

class PostAdWidget extends StatefulWidget {
  const PostAdWidget({super.key});

  @override
  State<PostAdWidget> createState() => _PostAdWidgetState();
}

class _PostAdWidgetState extends State<PostAdWidget>
    with TickerProviderStateMixin {
  late PostAdModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostAdModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.jobTitileController ??= TextEditingController();
    _model.jobTitileFocusNode ??= FocusNode();

    _model.instituteNameController ??= TextEditingController();
    _model.instituteNameFocusNode ??= FocusNode();

    _model.fromController ??= TextEditingController();
    _model.fromFocusNode ??= FocusNode();

    _model.toController ??= TextEditingController();
    _model.toFocusNode ??= FocusNode();

    _model.subjectController1 ??= TextEditingController();
    _model.subjectFocusNode1 ??= FocusNode();

    _model.subjectController2 ??= TextEditingController();
    _model.subjectFocusNode2 ??= FocusNode();

    _model.othernotesController ??= TextEditingController();
    _model.othernotesFocusNode ??= FocusNode();
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            ClipRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 30.0,
                  sigmaY: 30.0,
                ),
                child: Opacity(
                  opacity: 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/background_image.png',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 49.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(29.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(29.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: Container(
                          height: 62.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Post Ad',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Expanded(
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.tabBarCurrentIndex ==
                                                  0) {
                                                context.pushNamed('homePage');
                                              } else {
                                                setState(() {
                                                  _model.tabBarController!
                                                      .animateTo(
                                                    max(
                                                        0,
                                                        _model.tabBarController!
                                                                .index -
                                                            1),
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                });
                                              }
                                            },
                                            child: Text(
                                              _model.tabBarCurrentIndex == 0
                                                  ? 'Skip'
                                                  : 'Back',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(width: 23.0))
                                      .around(const SizedBox(width: 23.0)),
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent4,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: const Alignment(-1.0, 0),
                                child: FlutterFlowButtonTabBar(
                                  useToggleButtonStyle: true,
                                  isScrollable: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Sora',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  unselectedLabelStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Sora',
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor: const Color(0x80001451),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  unselectedBackgroundColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  borderColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  unselectedBorderColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  borderWidth: 0.0,
                                  borderRadius: 0.0,
                                  elevation: 0.0,
                                  labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  tabs: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.5, 1.5, 0.0),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: valueOrDefault<Color>(
                                              _model.tabBarCurrentIndex == 0
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent4
                                                  : FlutterFlowTheme.of(context)
                                                      .secondary,
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                            ),
                                            size: 16.0,
                                          ),
                                        ),
                                        const Tab(
                                          text: 'JOB DETAILS',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.5, 1.5, 0.0),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: valueOrDefault<Color>(
                                              _model.tabBarCurrentIndex <= 1
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent4
                                                  : FlutterFlowTheme.of(context)
                                                      .secondary,
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                            ),
                                            size: 16.0,
                                          ),
                                        ),
                                        const Tab(
                                          text: 'REQUIREMENTS',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.5, 1.5, 0.0),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: valueOrDefault<Color>(
                                              _model.tabBarCurrentIndex <= 2
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent4
                                                  : FlutterFlowTheme.of(context)
                                                      .secondary,
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                            ),
                                            size: 16.0,
                                          ),
                                        ),
                                        const Tab(
                                          text: 'INTERVIEW',
                                        ),
                                      ],
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [
                                      () async {},
                                      () async {},
                                      () async {}
                                    ][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Form(
                                        key: _model.formKey3,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 10.0),
                                                child: Text(
                                                  'Job Title *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .jobTitileController,
                                                  focusNode:
                                                      _model.jobTitileFocusNode,
                                                  textCapitalization:
                                                      TextCapitalization.words,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'ex: Wanted Physics teachers',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 13.0,
                                                      ),
                                                  validator: _model
                                                      .jobTitileControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 25.0, 10.0),
                                                child: Text(
                                                  'Requirement For *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 0.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('School'),
                                                    ChipData('College'),
                                                    ChipData('ITI'),
                                                    ChipData('Polytechnic'),
                                                    ChipData('University'),
                                                    ChipData('IIT'),
                                                    ChipData('Coaching Center'),
                                                    ChipData('Other Institute')
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .requirementForValue =
                                                          val?.first),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        const Color(0x00000000),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color:
                                                              const Color(0xB2001451),
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                    borderWidth: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 17.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .requirementForValue !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .requirementForValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    ['College'],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 25.0, 10.0),
                                                child: Text(
                                                  'Job Type *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 0.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('Full Time'),
                                                    ChipData('Part Time'),
                                                    ChipData('Freelance')
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () =>
                                                          _model.jobTypeValue =
                                                              val?.first),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        const Color(0x00000000),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color:
                                                              const Color(0xB3001451),
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                    borderWidth: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 17.0,
                                                  multiselect: false,
                                                  initialized:
                                                      _model.jobTypeValue !=
                                                          null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .jobTypeValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    ['Full Time'],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 25.0, 10.0),
                                                child: Text(
                                                  'Shift *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 0.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('Day / Regular'),
                                                    ChipData('Evening only')
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model.shiftValue =
                                                          val?.first),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        const Color(0x00000000),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color:
                                                              const Color(0xB3001451),
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                    borderWidth: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  chipSpacing: 20.0,
                                                  rowSpacing: 12.0,
                                                  multiselect: false,
                                                  initialized:
                                                      _model.shiftValue != null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .shiftValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    ['Day / Regular'],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 25.0, 10.0),
                                                child: Text(
                                                  'School / Institute Name *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .instituteNameController,
                                                  focusNode: _model
                                                      .instituteNameFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'ex : Satyabama University',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          fontSize: 13.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 3.0,
                                                                10.0, 3.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  validator: _model
                                                      .instituteNameControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 25.0, 10.0),
                                                child: Text(
                                                  'Upload Logo',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          21.0, 0.0, 25.0, 0.0),
                                                  child: Stack(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 1.0),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Container(
                                                          width: 120.0,
                                                          height: 120.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              _model.uploadedFileUrl !=
                                                                          ''
                                                                  ? _model
                                                                      .uploadedFileUrl
                                                                  : 'https://firebasestorage.googleapis.com/v0/b/teachnear.appspot.com/o/appImages%2Fimage.svg?alt=media&token=8114cb57-92aa-4cc2-9cda-54f1f3be48b1',
                                                              'https://firebasestorage.googleapis.com/v0/b/teachnear.appspot.com/o/appImages%2Fimage.svg?alt=media&token=8114cb57-92aa-4cc2-9cda-54f1f3be48b1',
                                                            ),
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 48.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          final selectedMedia =
                                                              await selectMediaWithSourceBottomSheet(
                                                            context: context,
                                                            maxWidth: 512.00,
                                                            maxHeight: 512.00,
                                                            imageQuality: 70,
                                                            allowPhoto: true,
                                                            includeDimensions:
                                                                true,
                                                            pickerFontFamily:
                                                                'Sora',
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            setState(() => _model
                                                                    .isDataUploading =
                                                                true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            var downloadUrls =
                                                                <String>[];
                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
                                                                          .wait(
                                                                selectedMedia
                                                                    .map(
                                                                  (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                ),
                                                              ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                              setState(() {
                                                                _model.uploadedLocalFile =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                                _model.uploadedFileUrl =
                                                                    downloadUrls
                                                                        .first;
                                                              });
                                                            } else {
                                                              setState(() {});
                                                              return;
                                                            }
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 25.0, 10.0),
                                                child: Text(
                                                  'Upload Images ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 0.0),
                                                child: Container(
                                                  height: 50.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFFFFF0F5),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'Upload Up to 5 Images',
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
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final images = List.generate(
                                                            random_data
                                                                .randomInteger(
                                                                    5, 5),
                                                            (index) => random_data
                                                                .randomInteger(
                                                                    0, 10))
                                                        .toList()
                                                        .take(5)
                                                        .toList();
                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                                images.length,
                                                                (imagesIndex) {
                                                          final imagesItem =
                                                              images[
                                                                  imagesIndex];
                                                          return wrapWithModel(
                                                            model: _model
                                                                .uploadAdImageModels
                                                                .getModel(
                                                              imagesIndex
                                                                  .toString(),
                                                              imagesIndex,
                                                            ),
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            updateOnChange:
                                                                true,
                                                            child:
                                                                UploadAdImageWidget(
                                                              key: Key(
                                                                'Keynbo_${imagesIndex.toString()}',
                                                              ),
                                                            ),
                                                          );
                                                        })
                                                            .divide(const SizedBox(
                                                                width: 10.0))
                                                            .addToStart(
                                                                const SizedBox(
                                                                    width:
                                                                        21.0))
                                                            .addToEnd(const SizedBox(
                                                                width: 25.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 25.0, 10.0),
                                                child: Text(
                                                  'Salary(Per Month) *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller:
                                                          _model.fromController,
                                                      focusNode:
                                                          _model.fromFocusNode,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                ),
                                                        hintText: '30,000',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        prefixIcon: const Icon(
                                                          Icons.currency_rupee,
                                                          size: 14.0,
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(
                                                              decimal: true),
                                                      validator: _model
                                                          .fromControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
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
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            'TO',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  fontSize:
                                                                      13.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      width: 0.0,
                                                      child: TextFormField(
                                                        controller:
                                                            _model.toController,
                                                        focusNode:
                                                            _model.toFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          hintText: '50,000',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Sora',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent3,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10.0),
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10.0),
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10.0),
                                                            ),
                                                          ),
                                                          prefixIcon: const Icon(
                                                            Icons
                                                                .currency_rupee,
                                                            size: 14.0,
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        keyboardType:
                                                            const TextInputType
                                                                .numberWithOptions(
                                                                decimal: true),
                                                        validator: _model
                                                            .toControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .addToStart(
                                                        const SizedBox(width: 21.0))
                                                    .addToEnd(
                                                        const SizedBox(width: 25.0)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 25.0, 10.0),
                                                child: Text(
                                                  'Do you offer any addtional perks ?',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 0.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('Accommodation',
                                                        Icons.add),
                                                    ChipData(
                                                        'Travel', Icons.add),
                                                    ChipData('Food', Icons.add)
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .choiceChipsValues =
                                                          val),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    iconSize: 13.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        const Color(0x00000000),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color:
                                                              const Color(0xB3001451),
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        const Color(0xB3001451),
                                                    iconSize: 13.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                    borderWidth: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 12.0,
                                                  multiselect: true,
                                                  initialized: _model
                                                          .choiceChipsValues !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .choiceChipsValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 25.0, 10.0),
                                                child: Text(
                                                  'Job Location *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 0.0),
                                                child: FlutterFlowPlacePicker(
                                                  iOSGoogleMapsApiKey:
                                                      'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                                                  androidGoogleMapsApiKey:
                                                      'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                                                  webGoogleMapsApiKey:
                                                      'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                                                  onSelect: (place) async {
                                                    setState(() => _model
                                                            .jobLocationValue =
                                                        place);
                                                  },
                                                  defaultText:
                                                      'Select Location',
                                                  icon: Icon(
                                                    Icons.place,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 16.0,
                                                  ),
                                                  buttonOptions:
                                                      FFButtonOptions(
                                                    width: 200.0,
                                                    height: 40.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 25.0, 23.0, 10.0),
                                                child: Text(
                                                  'Receive applications from',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFFFF0F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'You only receive applications and suggestions\n from selected location.\nThis will include candidates who are located and looking for a job in your state / district.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 10.0, 25.0, 10.0),
                                                child: FlutterFlowPlacePicker(
                                                  iOSGoogleMapsApiKey:
                                                      'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                                                  androidGoogleMapsApiKey:
                                                      'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                                                  webGoogleMapsApiKey:
                                                      'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                                                  onSelect: (place) async {
                                                    setState(() => _model
                                                            .placePickerValue =
                                                        place);
                                                  },
                                                  defaultText:
                                                      'Select Location',
                                                  icon: Icon(
                                                    Icons.place,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 16.0,
                                                  ),
                                                  buttonOptions:
                                                      FFButtonOptions(
                                                    width: 200.0,
                                                    height: 40.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ),
                                            ]
                                                .addToStart(
                                                    const SizedBox(height: 22.0))
                                                .addToEnd(
                                                    const SizedBox(height: 22.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Form(
                                        key: _model.formKey2,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 22.0, 0.0, 10.0),
                                                child: Text(
                                                  'Gender *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final genderOption = Gender
                                                      .values
                                                      .toList()
                                                      .take(3)
                                                      .toList();
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: List.generate(
                                                              genderOption
                                                                  .length,
                                                              (genderOptionIndex) {
                                                        final genderOptionItem =
                                                            genderOption[
                                                                genderOptionIndex];
                                                        return wrapWithModel(
                                                          model: _model
                                                              .sqaureChoiceChipsModels
                                                              .getModel(
                                                            genderOptionItem
                                                                .name,
                                                            genderOptionIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              SqaureChoiceChipsWidget(
                                                            key: Key(
                                                              'Keyv3f_${genderOptionItem.name}',
                                                            ),
                                                            value:
                                                                genderOptionItem
                                                                    .name,
                                                            selected: _model
                                                                .gender
                                                                .where((e) =>
                                                                    e ==
                                                                    genderOptionItem)
                                                                .toList()
                                                                .isNotEmpty,
                                                            image: () {
                                                              if (genderOptionItem ==
                                                                  Gender.Male) {
                                                                return 'https://static.wixstatic.com/media/83945f_add54d39dbb54951b840c1c9435d97f7~mv2.png/v1/fill/w_95,h_94,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/homem.png';
                                                              } else if (genderOptionItem ==
                                                                  Gender
                                                                      .Female) {
                                                                return 'https://esg.wharton.upenn.edu/wp-content/uploads/2023/03/wharton-women-icon-5.png';
                                                              } else {
                                                                return 'https://nrd.irsn.fr/sites/nrd/files/styles/default/public/2023-12/adultes-radiologie-conventionnelle.png?itok=d36HEsc7';
                                                              }
                                                            }(),
                                                            onTap: () async {
                                                              if (_model.gender
                                                                  .where((e) =>
                                                                      e ==
                                                                      genderOptionItem)
                                                                  .toList()
                                                                  .isNotEmpty) {
                                                                setState(() {
                                                                  _model.removeFromGender(
                                                                      genderOptionItem);
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _model.addToGender(
                                                                      genderOptionItem);
                                                                });
                                                              }
                                                            },
                                                          ),
                                                        );
                                                      })
                                                          .divide(const SizedBox(
                                                              width: 10.0))
                                                          .addToStart(const SizedBox(
                                                              width: 21.0))
                                                          .addToEnd(const SizedBox(
                                                              width: 25.0)),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 0.0, 0.0),
                                                child: Text(
                                                  ' Education*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 21.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.subjectController1,
                                                  focusNode:
                                                      _model.subjectFocusNode1,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color:
                                                              const Color(0x7F001451),
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    hintText:
                                                        'ex: PhD in Physics',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFCFD9DE),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                  validator: _model
                                                      .subjectController1Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 23.0, 0.0, 0.0),
                                                child: Text(
                                                  'Subjects*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 21.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.subjectController2,
                                                  focusNode:
                                                      _model.subjectFocusNode2,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color:
                                                              const Color(0x7F001451),
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    hintText:
                                                        'Enter Subject with comma',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFCFD9DE),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                  validator: _model
                                                      .subjectController2Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 21.0, 0.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('Any'),
                                                    ChipData('+ English'),
                                                    ChipData('+ Math'),
                                                    ChipData('+ Art'),
                                                    ChipData('+ Science'),
                                                    ChipData('+ History'),
                                                    ChipData('+ Geography'),
                                                    ChipData('+ Music'),
                                                    ChipData(
                                                        '+ Physical Education'),
                                                    ChipData('+ Drama'),
                                                    ChipData('+ Biology'),
                                                    ChipData('+ Chemistry'),
                                                    ChipData('More')
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .experiencechipsValue1 =
                                                          val?.first),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        const Color(0xFFF3F5F7),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        const Color(0xFFF3F5F7),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 10.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .experiencechipsValue1 !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .experiencechipsValueController1 ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    ['Any'],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Experience Required *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('Any'),
                                                    ChipData('Freshers'),
                                                    ChipData('Experienced')
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .experiencechipsValue2 =
                                                          val?.first),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        const Color(0xFFF3F5F7),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 17.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .experiencechipsValue2 !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .experiencechipsValueController2 ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    ['Any'],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'English Level *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('No'),
                                                    ChipData('Basic'),
                                                    ChipData('Intermediate'),
                                                    ChipData('Advanced')
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .englishchipsValue =
                                                          val?.first),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 17.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .englishchipsValue !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .englishchipsValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    ['No'],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Regional Language *',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 0.0, 21.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('Other'),
                                                    ChipData('+Tamil'),
                                                    ChipData('+Mayalam'),
                                                    ChipData('+Hindi')
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .regionallanguageschipsValues =
                                                          val),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        const Color(0xFFF3F5F7),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 17.0,
                                                  multiselect: true,
                                                  initialized: _model
                                                          .regionallanguageschipsValues !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .regionallanguageschipsValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Form(
                                      key: _model.formKey1,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 22.0, 0.0, 10.0),
                                                child: Text(
                                                  'Interview Type*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      21.0, 0.0, 25.0, 23.0),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.interviewType =
                                                                InterviewMode
                                                                    .DIRECT;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .interviewType ==
                                                                    InterviewMode
                                                                        .DIRECT
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : const Color(
                                                                    0xFFF3F5F7),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            border: Border.all(
                                                              color: _model
                                                                          .interviewType ==
                                                                      InterviewMode
                                                                          .DIRECT
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : const Color(
                                                                      0xFFF3F5F7),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/male.png',
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              Text(
                                                                'DIRECT',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Sora',
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
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
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.interviewType =
                                                                InterviewMode
                                                                    .PHONE;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model.interviewType ==
                                                                    InterviewMode
                                                                        .PHONE
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : const Color(
                                                                    0xFFF3F5F7),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            border: Border.all(
                                                              color: _model
                                                                          .interviewType ==
                                                                      InterviewMode
                                                                          .PHONE
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : const Color(
                                                                      0xFFF3F5F7),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/female.png',
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              Text(
                                                                'PHONE',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Sora',
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: _model
                                                                    .interviewType ==
                                                                InterviewMode
                                                                    .VIDEO
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : const Color(0xFFF3F5F7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        border: Border.all(
                                                          color: _model
                                                                      .interviewType ==
                                                                  InterviewMode
                                                                      .VIDEO
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : const Color(
                                                                  0xFFF3F5F7),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/both.png',
                                                            width: 40.0,
                                                            height: 40.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          Text(
                                                            'VIDEO',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 0.0, 10.0),
                                                child: Text(
                                                  'Interview Date*',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 10.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('Anytime'),
                                                    ChipData('Custom')
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .timeChoiceChipValue =
                                                          val?.first),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        const Color(0xFFF3F5F7),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 13.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    labelPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 4.0,
                                                                14.0, 4.0),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 17.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .timeChoiceChipValue !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .timeChoiceChipValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    ['Anytime'],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ),
                                            ),
                                            if (_model.timeChoiceChipValue ==
                                                'Custom')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 25.0, 0.0),
                                                child: Container(
                                                  height: 46.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Expanded(
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            final datePicked1Date =
                                                                await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  getCurrentTimestamp,
                                                              firstDate:
                                                                  getCurrentTimestamp,
                                                              lastDate:
                                                                  DateTime(
                                                                      2050),
                                                              builder: (context,
                                                                  child) {
                                                                return wrapInMaterialDatePickerTheme(
                                                                  context,
                                                                  child!,
                                                                  headerBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  headerForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  headerTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Sora',
                                                                        fontSize:
                                                                            32.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                  pickerBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  pickerForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  selectedDateTimeBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  selectedDateTimeForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  actionButtonForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  iconSize:
                                                                      24.0,
                                                                );
                                                              },
                                                            );

                                                            TimeOfDay?
                                                                datePicked1Time;
                                                            if (datePicked1Date !=
                                                                null) {
                                                              datePicked1Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                                builder:
                                                                    (context,
                                                                        child) {
                                                                  return wrapInMaterialTimePickerTheme(
                                                                    context,
                                                                    child!,
                                                                    headerBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    headerForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    headerTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Sora',
                                                                          fontSize:
                                                                              32.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    pickerBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    pickerForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    selectedDateTimeBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    selectedDateTimeForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    actionButtonForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    iconSize:
                                                                        24.0,
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            if (datePicked1Date !=
                                                                    null &&
                                                                datePicked1Time !=
                                                                    null) {
                                                              safeSetState(() {
                                                                _model.datePicked1 =
                                                                    DateTime(
                                                                  datePicked1Date
                                                                      .year,
                                                                  datePicked1Date
                                                                      .month,
                                                                  datePicked1Date
                                                                      .day,
                                                                  datePicked1Time!
                                                                      .hour,
                                                                  datePicked1Time
                                                                      .minute,
                                                                );
                                                              });
                                                            }
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.4,
                                                            height: 55.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  _model.datePicked1 !=
                                                                          null
                                                                      ? dateTimeFormat(
                                                                          'MMMMEEEdjm',
                                                                          _model
                                                                              .datePicked1)
                                                                      : 'Start Time',
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Sora',
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
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
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Text(
                                                              'TO',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Sora',
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            final datePicked2Date =
                                                                await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  getCurrentTimestamp,
                                                              firstDate:
                                                                  getCurrentTimestamp,
                                                              lastDate:
                                                                  DateTime(
                                                                      2050),
                                                              builder: (context,
                                                                  child) {
                                                                return wrapInMaterialDatePickerTheme(
                                                                  context,
                                                                  child!,
                                                                  headerBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  headerForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  headerTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Sora',
                                                                        fontSize:
                                                                            32.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                  pickerBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  pickerForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  selectedDateTimeBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  selectedDateTimeForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  actionButtonForegroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  iconSize:
                                                                      24.0,
                                                                );
                                                              },
                                                            );

                                                            TimeOfDay?
                                                                datePicked2Time;
                                                            if (datePicked2Date !=
                                                                null) {
                                                              datePicked2Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                                builder:
                                                                    (context,
                                                                        child) {
                                                                  return wrapInMaterialTimePickerTheme(
                                                                    context,
                                                                    child!,
                                                                    headerBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    headerForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    headerTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Sora',
                                                                          fontSize:
                                                                              32.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                    pickerBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    pickerForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    selectedDateTimeBackgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    selectedDateTimeForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    actionButtonForegroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    iconSize:
                                                                        24.0,
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            if (datePicked2Date !=
                                                                    null &&
                                                                datePicked2Time !=
                                                                    null) {
                                                              safeSetState(() {
                                                                _model.datePicked2 =
                                                                    DateTime(
                                                                  datePicked2Date
                                                                      .year,
                                                                  datePicked2Date
                                                                      .month,
                                                                  datePicked2Date
                                                                      .day,
                                                                  datePicked2Time!
                                                                      .hour,
                                                                  datePicked2Time
                                                                      .minute,
                                                                );
                                                              });
                                                            }
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.4,
                                                            height: 55.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10.0),
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model.datePicked2 !=
                                                                            null
                                                                        ? dateTimeFormat(
                                                                            'MMMMEEEdjm',
                                                                            _model.datePicked2)
                                                                        : 'End Time',
                                                                    '00',
                                                                  ),
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Sora',
                                                                        fontSize:
                                                                            12.0,
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
                                              ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 23.0, 0.0, 10.0),
                                                child: Text(
                                                  'Other Notes',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      21.0, 0.0, 25.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.othernotesController,
                                                focusNode:
                                                    _model.othernotesFocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        color:
                                                            const Color(0x7F001451),
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintText:
                                                      'Any missing notes..',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFCFD9DE),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                maxLines: null,
                                                minLines: 4,
                                                validator: _model
                                                    .othernotesControllerValidator
                                                    .asValidator(context),
                                              ),
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
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    19.0, 16.0, 19.0, 32.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.tabBarCurrentIndex == 0) {
                                      if (_model.formKey3.currentState ==
                                              null ||
                                          !_model.formKey3.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.jobLocationValue ==
                                          const FFPlace()) {
                                        return;
                                      }
                                      setState(() {
                                        _model.tabBarController!.animateTo(
                                          min(
                                              _model.tabBarController!.length -
                                                  1,
                                              _model.tabBarController!.index +
                                                  1),
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      });
                                    } else if (_model.tabBarCurrentIndex == 1) {
                                      if (_model.formKey2.currentState ==
                                              null ||
                                          !_model.formKey2.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      setState(() {
                                        _model.tabBarController!.animateTo(
                                          min(
                                              _model.tabBarController!.length -
                                                  1,
                                              _model.tabBarController!.index +
                                                  1),
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      });
                                    } else {
                                      if (_model.formKey1.currentState ==
                                              null ||
                                          !_model.formKey1.currentState!
                                              .validate()) {
                                        return;
                                      }

                                      var adsRecordReference =
                                          AdsRecord.collection.doc();
                                      await adsRecordReference.set({
                                        ...createAdsRecordData(
                                          positionTitle:
                                              _model.jobTitileController.text,
                                          schoolInstitute: _model
                                              .instituteNameController.text,
                                          requirementFor:
                                              _model.requirementForValue,
                                          jobType: _model.jobTypeValue,
                                          shift: _model.shiftValue,
                                          monthlySalary:
                                              updateSalaryRangeStruct(
                                            SalaryRangeStruct(
                                              from: int.tryParse(
                                                  _model.fromController.text),
                                              to: int.tryParse(
                                                  _model.toController.text),
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          jobLocation: updateAddressStruct(
                                            AddressStruct(
                                              latLang: _model
                                                  .jobLocationValue.latLng,
                                              zipCode: _model
                                                  .jobLocationValue.zipCode,
                                              city:
                                                  _model.jobLocationValue.city,
                                              address: _model
                                                  .jobLocationValue.address,
                                              state:
                                                  _model.jobLocationValue.state,
                                              country: _model
                                                  .jobLocationValue.country,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          lookingJobForSelectedStates:
                                              updateAddressStruct(
                                            AddressStruct(
                                              latLang: _model
                                                  .placePickerValue.latLng,
                                              zipCode: _model
                                                  .placePickerValue.zipCode,
                                              city:
                                                  _model.placePickerValue.city,
                                              address: _model
                                                  .placePickerValue.address,
                                              state:
                                                  _model.placePickerValue.state,
                                              country: _model
                                                  .placePickerValue.country,
                                              name:
                                                  _model.placePickerValue.name,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          createdBy: currentUserReference,
                                          logo: _model.uploadedFileUrl,
                                          educationRequired:
                                              updateEducationStruct(
                                            EducationStruct(
                                              subject: _model
                                                  .subjectController1.text,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          englishLevel:
                                              _model.englishchipsValue,
                                          experienceType:
                                              _model.experiencechipsValue1,
                                          interviewMode: _model.interviewType,
                                          interviewDate:
                                              updateFromToDateTimeStruct(
                                            FromToDateTimeStruct(
                                              from: _model.datePicked1,
                                              to: _model.datePicked2,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'additional_perks':
                                                _model.choiceChipsValues,
                                            'overview_images': _model
                                                .uploadAdImageModels
                                                .getValues(
                                              (m) => m.uploadedFileUrl,
                                            ),
                                            'regional_language': _model
                                                .regionallanguageschipsValues,
                                            'preferred_gender': _model.gender
                                                .map((e) => e.serialize())
                                                .toList(),
                                          },
                                        ),
                                      });
                                      _model.createdDoc =
                                          AdsRecord.getDocumentFromData({
                                        ...createAdsRecordData(
                                          positionTitle:
                                              _model.jobTitileController.text,
                                          schoolInstitute: _model
                                              .instituteNameController.text,
                                          requirementFor:
                                              _model.requirementForValue,
                                          jobType: _model.jobTypeValue,
                                          shift: _model.shiftValue,
                                          monthlySalary:
                                              updateSalaryRangeStruct(
                                            SalaryRangeStruct(
                                              from: int.tryParse(
                                                  _model.fromController.text),
                                              to: int.tryParse(
                                                  _model.toController.text),
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          jobLocation: updateAddressStruct(
                                            AddressStruct(
                                              latLang: _model
                                                  .jobLocationValue.latLng,
                                              zipCode: _model
                                                  .jobLocationValue.zipCode,
                                              city:
                                                  _model.jobLocationValue.city,
                                              address: _model
                                                  .jobLocationValue.address,
                                              state:
                                                  _model.jobLocationValue.state,
                                              country: _model
                                                  .jobLocationValue.country,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          lookingJobForSelectedStates:
                                              updateAddressStruct(
                                            AddressStruct(
                                              latLang: _model
                                                  .placePickerValue.latLng,
                                              zipCode: _model
                                                  .placePickerValue.zipCode,
                                              city:
                                                  _model.placePickerValue.city,
                                              address: _model
                                                  .placePickerValue.address,
                                              state:
                                                  _model.placePickerValue.state,
                                              country: _model
                                                  .placePickerValue.country,
                                              name:
                                                  _model.placePickerValue.name,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          createdBy: currentUserReference,
                                          logo: _model.uploadedFileUrl,
                                          educationRequired:
                                              updateEducationStruct(
                                            EducationStruct(
                                              subject: _model
                                                  .subjectController1.text,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          englishLevel:
                                              _model.englishchipsValue,
                                          experienceType:
                                              _model.experiencechipsValue1,
                                          interviewMode: _model.interviewType,
                                          interviewDate:
                                              updateFromToDateTimeStruct(
                                            FromToDateTimeStruct(
                                              from: _model.datePicked1,
                                              to: _model.datePicked2,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'additional_perks':
                                                _model.choiceChipsValues,
                                            'overview_images': _model
                                                .uploadAdImageModels
                                                .getValues(
                                              (m) => m.uploadedFileUrl,
                                            ),
                                            'regional_language': _model
                                                .regionallanguageschipsValues,
                                            'preferred_gender': _model.gender
                                                .map((e) => e.serialize())
                                                .toList(),
                                          },
                                        ),
                                      }, adsRecordReference);

                                      context.goNamed('homePage');
                                    }

                                    setState(() {});
                                  },
                                  text: valueOrDefault<String>(
                                    _model.tabBarCurrentIndex < 2
                                        ? 'Continue'
                                        : 'Post',
                                    'Continue',
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 45.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Sora',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
