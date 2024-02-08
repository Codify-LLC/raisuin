import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/candidate_profile_card/candidate_profile_card_widget.dart';
import '/components/filter/filter_widget.dart';
import '/components/navigation/navigation_widget.dart';
import '/components/video_player/video_player_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      if (currentUserDisplayName == '') {
        context.pushNamed('Registration');
      }
      setState(() {
        _model.savedCandidates =
            (currentUserDocument?.savedCandidates.toList() ?? [])
                .toList()
                .cast<DocumentReference>();
      });
      if (!(FFAppState().location != null)) {
        setState(() {
          FFAppState().location = currentUserLocationValue;
        });
      }
      _model.reverseGecodingResult = await ReverseGeocodingCall.call(
        latlng: functions.latlngToString(FFAppState().location!),
      );
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 600),
        callback: (timer) async {
          FFAppState().location = _model.placePickerValue.latLng;
                },
        startImmediately: true,
      );
    });
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

    return StreamBuilder<List<AdsRecord>>(
      stream: queryAdsRecord(
        queryBuilder: (adsRecord) => adsRecord.where(
          'created_by',
          isEqualTo: currentUserReference,
        ),
      ),
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
        List<AdsRecord> homePageAdsRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0xFFF9FAFC),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 53.0, 0.0, 0.0),
                    child: Container(
                      height: 45.0,
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Hero(
                            tag: 'Logo',
                            transitionOnUserGestures: true,
                            child: SvgPicture.asset(
                              'assets/images/es_Logo.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  icon: FaIcon(
                                    FontAwesomeIcons.search,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 18.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed(
                                      'SearchCandidates',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          badges.Badge(
                            badgeContent: Text(
                              '1',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Sora',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                            ),
                            showBadge: true,
                            shape: badges.BadgeShape.circle,
                            badgeColor: const Color(0xFFD85E87),
                            elevation: 0.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            position: badges.BadgePosition.topEnd(),
                            animationType: badges.BadgeAnimationType.scale,
                            toAnimate: true,
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              icon: FaIcon(
                                FontAwesomeIcons.slidersH,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 16.0,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  isDismissible: false,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          child: const FilterWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ),
                        ].addToEnd(const SizedBox(width: 19.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 105.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if (_model.isMapView) {
                                    return Stack(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      children: [
                                        Builder(
                                          builder: (context) =>
                                              StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              queryBuilder: (usersRecord) =>
                                                  usersRecord.where(
                                                'profile_type',
                                                isEqualTo: ProfileType.Candidate
                                                    .serialize(),
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRecord>
                                                  customMapUsersRecordList =
                                                  snapshot.data!;
                                              return SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                child: custom_widgets.CustomMap(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  initialCenter:
                                                      FFAppState().location!,
                                                  userDocs:
                                                      customMapUsersRecordList,
                                                  onMarkerTap: (userDoc) async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child:
                                                                CandidateProfileCardWidget(
                                                              userRef: userDoc
                                                                  .reference,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  updateCandidateList:
                                                      (candidateList) async {
                                                    setState(() {
                                                      _model.candidatesInView =
                                                          candidateList
                                                              .toList()
                                                              .cast<
                                                                  UsersRecord>();
                                                    });
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: Builder(
                                              builder: (context) {
                                                final candidate = _model
                                                    .candidatesInView
                                                    .toList();
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                          candidate.length,
                                                          (candidateIndex) {
                                                    final candidateItem =
                                                        candidate[
                                                            candidateIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {},
                                                      child: Container(
                                                        width: 208.0,
                                                        constraints:
                                                            const BoxConstraints(
                                                          minHeight: 180.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFCFD9DE),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                candidateItem
                                                                    .displayName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/images/cap.svg',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final education = candidateItem
                                                                              .education
                                                                              .toList();
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(education.length, (educationIndex) {
                                                                              final educationItem = education[educationIndex];
                                                                              return Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  educationItem.educationType,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Sora',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.w300,
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
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/images/Location1.svg',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${candidateItem.address.city} ${candidateItem.address.state}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Sora',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.w300,
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
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            7.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      constraints:
                                                                          const BoxConstraints(
                                                                        minWidth:
                                                                            63.0,
                                                                        minHeight:
                                                                            30.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Text(
                                                                            candidateItem.gender!.name,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        constraints:
                                                                            const BoxConstraints(
                                                                          minWidth:
                                                                              63.0,
                                                                          minHeight:
                                                                              30.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              builder: (context) => Text(
                                                                                'Age ${functions.dateStringAgeCalculator(currentUserDocument!.dob!.toString()).toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Sora',
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.w300,
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
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.alldocs =
                                                                          await queryChatsRecordOnce(
                                                                        queryBuilder:
                                                                            (chatsRecord) =>
                                                                                chatsRecord.where(
                                                                          'users',
                                                                          arrayContains:
                                                                              getChatUserFirestoreData(
                                                                            ChatUserStruct(
                                                                              userRef: currentUserReference,
                                                                              userName: currentUserDisplayName,
                                                                              userEmail: currentUserEmail,
                                                                            ),
                                                                            true,
                                                                          ),
                                                                        ),
                                                                      );
                                                                      if (_model
                                                                          .alldocs!
                                                                          .where((e) => e
                                                                              .users
                                                                              .where((e) => e.userRef == candidateItem.reference)
                                                                              .toList()
                                                                              .isNotEmpty)
                                                                          .toList()
                                                                          .isNotEmpty) {
                                                                        context
                                                                            .pushNamed(
                                                                          'chatMessages',
                                                                          queryParameters:
                                                                              {
                                                                            'chatDoc':
                                                                                serializeParam(
                                                                              _model.alldocs?.where((e) => e.users.where((e) => e.userRef == candidateItem.reference).toList().isNotEmpty).toList().first.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      } else {
                                                                        var chatsRecordReference = ChatsRecord
                                                                            .collection
                                                                            .doc();
                                                                        await chatsRecordReference
                                                                            .set({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'users': [
                                                                                getChatUserFirestoreData(
                                                                                  createChatUserStruct(
                                                                                    userRef: currentUserReference,
                                                                                    userName: currentUserDisplayName,
                                                                                    userEmail: currentUserEmail,
                                                                                    clearUnsetFields: false,
                                                                                    create: true,
                                                                                  ),
                                                                                  true,
                                                                                )
                                                                              ],
                                                                            },
                                                                          ),
                                                                        });
                                                                        _model.createdChat =
                                                                            ChatsRecord.getDocumentFromData({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'users': [
                                                                                getChatUserFirestoreData(
                                                                                  createChatUserStruct(
                                                                                    userRef: currentUserReference,
                                                                                    userName: currentUserDisplayName,
                                                                                    userEmail: currentUserEmail,
                                                                                    clearUnsetFields: false,
                                                                                    create: true,
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
                                                                              'users': FieldValue.arrayUnion([
                                                                                getChatUserFirestoreData(
                                                                                  updateChatUserStruct(
                                                                                    ChatUserStruct(
                                                                                      userRef: candidateItem.reference,
                                                                                      userName: candidateItem.displayName,
                                                                                      userEmail: candidateItem.email,
                                                                                    ),
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                  true,
                                                                                )
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });

                                                                        context
                                                                            .pushNamed(
                                                                          'chatMessages',
                                                                          queryParameters:
                                                                              {
                                                                            'chatDoc':
                                                                                serializeParam(
                                                                              _model.createdChat?.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Send Message',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Sora',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                10.0,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
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
                                                      .divide(
                                                          const SizedBox(width: 10.0))
                                                      .addToStart(
                                                          const SizedBox(width: 20.0))
                                                      .addToEnd(const SizedBox(
                                                          width: 20.0)),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              icon: Icon(
                                                Icons.chevron_left,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  _model.isMapView = false;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else if (!_model.isMapView) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 14.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Stack(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.location_pin,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 16.0,
                                                          ),
                                                          Text(
                                                            _model.placePickerValue !=
                                                                    null
                                                                ? _model
                                                                    .placePickerValue
                                                                    .city
                                                                : ReverseGeocodingCall
                                                                    .city(
                                                                    (_model.reverseGecodingResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                      FlutterFlowPlacePicker(
                                                        iOSGoogleMapsApiKey:
                                                            'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                                                        androidGoogleMapsApiKey:
                                                            'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                                                        webGoogleMapsApiKey:
                                                            'AIzaSyDAPoNGbEG7CGHzQ74mkrjnixn1XR4scFQ',
                                                        onSelect:
                                                            (place) async {
                                                          setState(() => _model
                                                                  .placePickerValue =
                                                              place);
                                                        },
                                                        defaultText:
                                                            'Select Location',
                                                        icon: const Icon(
                                                          Icons.place,
                                                          color: Colors
                                                              .transparent,
                                                          size: 16.0,
                                                        ),
                                                        buttonOptions:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 40.0,
                                                          color: Colors
                                                              .transparent,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Sora',
                                                                    color: Colors
                                                                        .transparent,
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  '${_model.placePickerValue != null ? _model.placePickerValue.state : ReverseGeocodingCall.state(
                                                      (_model.reverseGecodingResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )}, ${_model.placePickerValue != null ? _model.placePickerValue.country : 'IN'}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ]
                                                  .addToStart(
                                                      const SizedBox(width: 20.0))
                                                  .addToEnd(
                                                      const SizedBox(width: 20.0)),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 134.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/mapView.png',
                                                ).image,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  AutoSizeText(
                                                    'Map View Experience',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Sora',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: AutoSizeText(
                                                      'Find candidates nearby location',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Sora',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 1.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        setState(() {
                                                          _model.isMapView =
                                                              true;
                                                        });
                                                      },
                                                      text: 'Map View',
                                                      icon: const Icon(
                                                        Icons.location_on,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                      14.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<
                                                    GeneralSettingsConfigRecord>>(
                                              stream:
                                                  queryGeneralSettingsConfigRecord(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<GeneralSettingsConfigRecord>
                                                    rowGeneralSettingsConfigRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final rowGeneralSettingsConfigRecord =
                                                    rowGeneralSettingsConfigRecordList
                                                            .isNotEmpty
                                                        ? rowGeneralSettingsConfigRecordList
                                                            .first
                                                        : null;
                                                return Builder(
                                                  builder: (context) {
                                                    final degrees =
                                                        rowGeneralSettingsConfigRecord
                                                                ?.degreeList
                                                                .toList() ??
                                                            [];
                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                                degrees.length,
                                                                (degreesIndex) {
                                                          final degreesItem =
                                                              degrees[
                                                                  degreesIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                degreesItem,
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
                                                              FutureBuilder<
                                                                  int>(
                                                                future:
                                                                    queryUsersRecordCount(
                                                                  queryBuilder:
                                                                      (usersRecord) =>
                                                                          usersRecord
                                                                              .where(
                                                                    'user_role',
                                                                    isEqualTo:
                                                                        '',
                                                                  ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  int textCount =
                                                                      snapshot
                                                                          .data!;
                                                                  return Text(
                                                                    '${formatNumber(
                                                                      textCount,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .automatic,
                                                                    )} Profiles',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Sora',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 10.0)),
                                                          );
                                                        })
                                                            .divide(const SizedBox(
                                                                width: 20.0))
                                                            .around(const SizedBox(
                                                                width: 20.0)),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          if (homePageAdsRecordList.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'MatchProfiles');
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Matched Candidates',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Sora',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'View All',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sora',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_right,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          if (homePageAdsRecordList.isNotEmpty)
                                            StreamBuilder<List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord
                                                        .where(
                                                          'profile_type',
                                                          isEqualTo: ProfileType
                                                                  .Candidate
                                                              .serialize(),
                                                        )
                                                        .where(
                                                          'preferred_posting',
                                                          isEqualTo: homePageAdsRecordList
                                                                      .first
                                                                      .jobLocation
                                                                      .city !=
                                                                  ''
                                                              ? homePageAdsRecordList
                                                                  .first
                                                                  .jobLocation
                                                                  .city
                                                              : null,
                                                        )
                                                        .where(
                                                          'salary_range.from',
                                                          isGreaterThanOrEqualTo:
                                                              homePageAdsRecordList
                                                                  .first
                                                                  .monthlySalary
                                                                  .from,
                                                        )
                                                        .where(
                                                          'seeking_job_post',
                                                          isEqualTo: homePageAdsRecordList
                                                                      .first
                                                                      .positionTitle !=
                                                                  ''
                                                              ? homePageAdsRecordList
                                                                  .first
                                                                  .positionTitle
                                                              : null,
                                                        ),
                                                limit: 5,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    rowUsersRecordList =
                                                    snapshot.data!;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List
                                                          .generate(
                                                              rowUsersRecordList
                                                                  .length,
                                                              (rowIndex) {
                                                    final rowUsersRecord =
                                                        rowUsersRecordList[
                                                            rowIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {},
                                                      child: Container(
                                                        width: 208.0,
                                                        constraints:
                                                            const BoxConstraints(
                                                          minHeight: 180.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFCFD9DE),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                rowUsersRecord
                                                                    .displayName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/images/cap.svg',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${rowUsersRecord.education.where((e) => e.primary).toList().first.educationType} ${rowUsersRecord.education.where((e) => e.primary).toList().first.degree} ${rowUsersRecord.education.where((e) => e.primary).toList().first.subject}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Sora',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.w300,
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
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/images/Location1.svg',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${rowUsersRecord.address.city} ${rowUsersRecord.address.state}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Sora',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.w300,
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
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            7.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      constraints:
                                                                          const BoxConstraints(
                                                                        minWidth:
                                                                            63.0,
                                                                        minHeight:
                                                                            30.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Text(
                                                                            rowUsersRecord.gender!.name,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        constraints:
                                                                            const BoxConstraints(
                                                                          minWidth:
                                                                              63.0,
                                                                          minHeight:
                                                                              30.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Text(
                                                                              'Age ${functions.dateStringAgeCalculator(rowUsersRecord.dob!.toString()).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Sora',
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.w300,
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
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.allChatDocs =
                                                                          await queryChatsRecordOnce(
                                                                        queryBuilder:
                                                                            (chatsRecord) =>
                                                                                chatsRecord.where(
                                                                          'users',
                                                                          arrayContains:
                                                                              getChatUserFirestoreData(
                                                                            ChatUserStruct(
                                                                              userRef: currentUserReference,
                                                                              userName: currentUserDisplayName,
                                                                              userEmail: currentUserEmail,
                                                                            ),
                                                                            true,
                                                                          ),
                                                                        ),
                                                                      );
                                                                      if (_model
                                                                          .allChatDocs!
                                                                          .where((e) => e
                                                                              .users
                                                                              .where((e) => e.userRef == rowUsersRecord.reference)
                                                                              .toList()
                                                                              .isNotEmpty)
                                                                          .toList()
                                                                          .isNotEmpty) {
                                                                        context
                                                                            .pushNamed(
                                                                          'chatMessages',
                                                                          queryParameters:
                                                                              {
                                                                            'chatDoc':
                                                                                serializeParam(
                                                                              _model.allChatDocs?.where((e) => e.users.where((e) => e.userRef == rowUsersRecord.reference).toList().isNotEmpty).toList().first.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      } else {
                                                                        var chatsRecordReference = ChatsRecord
                                                                            .collection
                                                                            .doc();
                                                                        await chatsRecordReference
                                                                            .set({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'users': [
                                                                                getChatUserFirestoreData(
                                                                                  createChatUserStruct(
                                                                                    userRef: currentUserReference,
                                                                                    userName: currentUserDisplayName,
                                                                                    userEmail: rowUsersRecord.email,
                                                                                    clearUnsetFields: false,
                                                                                    create: true,
                                                                                  ),
                                                                                  true,
                                                                                )
                                                                              ],
                                                                            },
                                                                          ),
                                                                        });
                                                                        _model.createdChatDoc =
                                                                            ChatsRecord.getDocumentFromData({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'users': [
                                                                                getChatUserFirestoreData(
                                                                                  createChatUserStruct(
                                                                                    userRef: currentUserReference,
                                                                                    userName: currentUserDisplayName,
                                                                                    userEmail: rowUsersRecord.email,
                                                                                    clearUnsetFields: false,
                                                                                    create: true,
                                                                                  ),
                                                                                  true,
                                                                                )
                                                                              ],
                                                                            },
                                                                          ),
                                                                        }, chatsRecordReference);

                                                                        await _model
                                                                            .createdChatDoc!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'users': FieldValue.arrayUnion([
                                                                                getChatUserFirestoreData(
                                                                                  updateChatUserStruct(
                                                                                    ChatUserStruct(
                                                                                      userRef: rowUsersRecord.reference,
                                                                                      userName: rowUsersRecord.displayName,
                                                                                      userEmail: rowUsersRecord.email,
                                                                                    ),
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                  true,
                                                                                )
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });

                                                                        context
                                                                            .pushNamed(
                                                                          'chatMessages',
                                                                          queryParameters:
                                                                              {
                                                                            'chatDoc':
                                                                                serializeParam(
                                                                              _model.createdChatDoc?.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Send Message',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Sora',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                10.0,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
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
                                                      .divide(
                                                          const SizedBox(width: 10.0))
                                                      .addToStart(
                                                          const SizedBox(width: 20.0))
                                                      .addToEnd(const SizedBox(
                                                          width: 20.0)),
                                                );
                                              },
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                    'profilesWithVideoBio');
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Profiles with video bio',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sora',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'View All',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sora',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_right,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              queryBuilder: (usersRecord) =>
                                                  usersRecord.where(
                                                'video_bio',
                                                isNotEqualTo: functions
                                                    .returnEmptyVideoPath(),
                                              ),
                                              limit: 10,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRecord>
                                                  rowUsersRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List
                                                          .generate(
                                                              rowUsersRecordList
                                                                  .length,
                                                              (rowIndex) {
                                                    final rowUsersRecord =
                                                        rowUsersRecordList[
                                                            rowIndex];
                                                    return Builder(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      VideoPlayerWidget(
                                                                    videopath:
                                                                        rowUsersRecord
                                                                            .videoBio,
                                                                    videoBio:
                                                                        true,
                                                                    canRef: rowUsersRecord
                                                                        .reference,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                rowUsersRecord
                                                                    .photoUrl,
                                                                width: 210.0,
                                                                height: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: 210.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .play_circle,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  size: 32.0,
                                                                ),
                                                                Text(
                                                                  rowUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/cap.svg',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${rowUsersRecord.education.where((e) => e.primary).toList().first.educationType} ${rowUsersRecord.education.where((e) => e.primary).toList().first.degree} ${rowUsersRecord.education.where((e) => e.primary).toList().first.subject}',
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
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/Location1.svg',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${rowUsersRecord.address.city} ${rowUsersRecord.address.state}',
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
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          7.0,
                                                                          0.0,
                                                                          7.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        rowUsersRecord
                                                                            .gender!
                                                                            .name,
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
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Text(
                                                                            'Age ${functions.dateStringAgeCalculator(rowUsersRecord.dob!.toString()).toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Sora',
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    );
                                                  })
                                                      .divide(
                                                          const SizedBox(width: 16.0))
                                                      .addToStart(
                                                          const SizedBox(width: 20.0))
                                                      .addToEnd(const SizedBox(
                                                          width: 20.0)),
                                                ),
                                              );
                                            },
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 23.0, 20.0, 10.0),
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
                                                    context.pushNamed(
                                                        'listCandidates');
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Search by subjects',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_right,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        21.0, 0.0, 21.0, 0.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: const [
                                                    ChipData('English'),
                                                    ChipData('Math'),
                                                    ChipData('Art'),
                                                    ChipData('Science'),
                                                    ChipData('History'),
                                                    ChipData('Geography'),
                                                    ChipData('Music'),
                                                    ChipData(
                                                        'Physical Education'),
                                                    ChipData('Drama'),
                                                    ChipData('Biology'),
                                                    ChipData('Chemistry')
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .experiencechipsValues =
                                                          val),
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
                                                    borderColor:
                                                        const Color(0xFF001451),
                                                    borderWidth: 1.0,
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
                                                    borderColor:
                                                        const Color(0xFF001451),
                                                    borderWidth: 1.0,
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 10.0,
                                                  multiselect: true,
                                                  initialized: _model
                                                          .experiencechipsValues !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .experiencechipsValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [],
                                                  ),
                                                  wrapped: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                20.0,
                                                                20.0,
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
                                                        context.pushNamed(
                                                            'listCandidates');
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'All Profiles',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<UsersRecord>>(
                                                    stream: queryUsersRecord(
                                                      queryBuilder:
                                                          (usersRecord) =>
                                                              usersRecord.where(
                                                        'profile_type',
                                                        isEqualTo: ProfileType
                                                                .Candidate
                                                            .serialize(),
                                                      ),
                                                      limit: 1,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<UsersRecord>
                                                          columnUsersRecordList =
                                                          snapshot.data!;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                                columnUsersRecordList
                                                                    .length,
                                                                (columnIndex) {
                                                          final columnUsersRecord =
                                                              columnUsersRecordList[
                                                                  columnIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'detailedprofilecandidate',
                                                                queryParameters:
                                                                    {
                                                                  'candidateProfile':
                                                                      serializeParam(
                                                                    columnUsersRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          60.0,
                                                                      height:
                                                                          60.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        columnUsersRecord
                                                                            .photoUrl,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              columnUsersRecord.displayName,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  SvgPicture.asset(
                                                                                    'assets/images/cap.svg',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        '${columnUsersRecord.education.where((e) => e.primary).toList().first.educationType} ${columnUsersRecord.education.where((e) => e.primary).toList().first.degree} ${columnUsersRecord.education.where((e) => e.primary).toList().first.subject}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Sora',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.w300,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  SvgPicture.asset(
                                                                                    'assets/images/Location1.svg',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        '${columnUsersRecord.address.city} ${columnUsersRecord.address.state}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Sora',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.w300,
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
                                                                  ]
                                                                      .addToStart(const SizedBox(
                                                                          width:
                                                                              20.0))
                                                                      .addToEnd(const SizedBox(
                                                                          width:
                                                                              20.0)),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Text(
                                                                            columnUsersRecord.gender!.name,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Text(
                                                                            'Age ${functions.dateStringAgeCalculator(columnUsersRecord.dob!.toString()).toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Text(
                                                                            '₹${columnUsersRecord.salaryRange.from.toString()} - ${columnUsersRecord.salaryRange.to.toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          ToggleIcon(
                                                                        onPressed:
                                                                            () async {
                                                                          setState(
                                                                            () => _model.savedCandidates.contains(columnUsersRecord.reference)
                                                                                ? _model.removeFromSavedCandidates(columnUsersRecord.reference)
                                                                                : _model.addToSavedCandidates(columnUsersRecord.reference),
                                                                          );
                                                                        },
                                                                        value: _model
                                                                            .savedCandidates
                                                                            .contains(columnUsersRecord.reference),
                                                                        onIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .favorite_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                        offIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .favorite_border,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]
                                                                      .addToStart(const SizedBox(
                                                                          width:
                                                                              20.0))
                                                                      .addToEnd(const SizedBox(
                                                                          width:
                                                                              20.0)),
                                                                ),
                                                                Divider(
                                                                  height: 1.0,
                                                                  thickness:
                                                                      1.0,
                                                                  indent: 20.0,
                                                                  endIndent:
                                                                      20.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                ),
                                                              ]
                                                                  .divide(const SizedBox(
                                                                      height:
                                                                          16.0))
                                                                  .around(const SizedBox(
                                                                      height:
                                                                          16.0)),
                                                            ),
                                                          );
                                                        })
                                                            .divide(const SizedBox(
                                                                height: 14.0))
                                                            .addToStart(
                                                                const SizedBox(
                                                                    height:
                                                                        20.0))
                                                            .addToEnd(const SizedBox(
                                                                height: 20.0)),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 20.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                      'listCandidates');
                                                },
                                                text: 'View All Profile',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.8,
                                                  height: 46.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFF9FAFC),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return SizedBox(
                                      height: 200.0,
                                      child: FlutterFlowGoogleMap(
                                        controller:
                                            _model.doNotDeletesController,
                                        onCameraIdle: (latLng) =>
                                            _model.doNotDeletesCenter = latLng,
                                        initialLocation:
                                            _model.doNotDeletesCenter ??=
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
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            wrapWithModel(
                              model: _model.navigationModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: const Hero(
                                tag: 'BottomNavBar',
                                transitionOnUserGestures: true,
                                child: Material(
                                  color: Colors.transparent,
                                  child: NavigationWidget(
                                    home: true,
                                    search: false,
                                    ads: false,
                                    messages: false,
                                    accounts: false,
                                  ),
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
          ),
        );
      },
    );
  }
}
