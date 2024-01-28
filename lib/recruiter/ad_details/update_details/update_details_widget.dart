import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'update_details_model.dart';
export 'update_details_model.dart';

class UpdateDetailsWidget extends StatefulWidget {
  const UpdateDetailsWidget({super.key});

  @override
  State<UpdateDetailsWidget> createState() => _UpdateDetailsWidgetState();
}

class _UpdateDetailsWidgetState extends State<UpdateDetailsWidget> {
  late UpdateDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateDetailsModel());

    _model.organizationNameFocusNode ??= FocusNode();

    _model.userRoleFocusNode ??= FocusNode();

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final updateDetailsUsersRecord = snapshot.data!;
        return Title(
            title: 'UpdateDetails',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: const Color(0xFFF9FAFC),
                appBar: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
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
                  title: Text(
                    'Update Profile Details',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Sora',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16.0,
                        ),
                  ),
                  actions: const [],
                  centerTitle: false,
                  elevation: 2.0,
                ),
                body: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent3,
                      ),
                      Expanded(
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 120.0,
                                        height: 120.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          getCORSProxyUrl(
                                            () {
                                              if (_model.uploadedFileUrl !=
                                                      '') {
                                                return _model.uploadedFileUrl;
                                              } else if (updateDetailsUsersRecord
                                                          .photoUrl !=
                                                      '') {
                                                return updateDetailsUsersRecord
                                                    .photoUrl;
                                              } else {
                                                return 'https://firebasestorage.googleapis.com/v0/b/teachnear.appspot.com/o/appImages%2FEllipse_15.png?alt=media&token=8091626b-c632-4899-8615-909b59cb00bb&_gl=1*43b4ir*_ga*NDg3MzE0Mzk2LjE2NzE3MDc4MjA.*_ga_CW55HF8NVT*MTY4NjMzNTAxOS4xMDcuMS4xNjg2MzM1NDg1LjAuMC4w';
                                              }
                                            }(),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.85, 0.46),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          icon: Icon(
                                            Icons.edit,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              maxWidth: 512.00,
                                              maxHeight: 512.00,
                                              imageQuality: 70,
                                              allowPhoto: true,
                                              includeDimensions: true,
                                              pickerFontFamily: 'Sora',
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              var downloadUrls = <String>[];
                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 10.0)),
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.organizationNameController ??=
                                            TextEditingController(
                                      text:
                                          updateDetailsUsersRecord.displayName,
                                    ),
                                    focusNode: _model.organizationNameFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Organization Name',
                                      hintText: 'Organization Name',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Sora',
                                            fontSize: 13.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10.0, 3.0, 10.0, 3.0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    maxLines: null,
                                    validator: _model
                                        .organizationNameControllerValidator
                                        .asValidator(context),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Organization Address',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      FlutterFlowPlacePicker(
                                        iOSGoogleMapsApiKey:
                                            'AIzaSyCUYFTqHoBAwrhtTFJVutYuCl5FTbnUiCo',
                                        androidGoogleMapsApiKey:
                                            'AIzaSyA34uygr4KVPS-GNKrx2x3haGQ3qN3UZQA',
                                        webGoogleMapsApiKey:
                                            'AIzaSyBwzhV9Ojw90qz6VfI3odvrB6P8EfbumOc',
                                        onSelect: (place) async {
                                          setState(() =>
                                              _model.placePickerValue = place);
                                        },
                                        defaultText: 'Select Location',
                                        icon: Icon(
                                          Icons.place,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 16.0,
                                        ),
                                        buttonOptions: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 50.0,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Sora',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ]
                                        .divide(const SizedBox(height: 20.0))
                                        .around(const SizedBox(height: 20.0)),
                                  ),
                                  Text(
                                    'Profile Type',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Sora',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  FlutterFlowChoiceChips(
                                    options: const [
                                      ChipData('School'),
                                      ChipData('Institution'),
                                      ChipData('Agency')
                                    ],
                                    onChanged: (val) => setState(() =>
                                        _model.choiceChipsValue = val?.first),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Sora',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 13.0,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      iconSize: 0.0,
                                      labelPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              14.0, 6.0, 14.0, 8.0),
                                      elevation: 0.0,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Sora',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 13.0,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      iconSize: 18.0,
                                      labelPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              14.0, 6.0, 14.0, 8.0),
                                      elevation: 0.0,
                                    ),
                                    chipSpacing: 5.0,
                                    rowSpacing: 12.0,
                                    multiselect: false,
                                    initialized:
                                        _model.choiceChipsValue != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      [updateDetailsUsersRecord.profileType],
                                    ),
                                    wrapped: true,
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 23.0, 0.0, 10.0),
                                      child: Text(
                                        'School Name',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your Role',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.userRoleController ??=
                                                TextEditingController(
                                          text:
                                              updateDetailsUsersRecord.userRole,
                                        ),
                                        focusNode: _model.userRoleFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText:
                                              'ex : Principal / Correspodent..',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Sora',
                                                    fontSize: 13.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 3.0, 10.0, 3.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .userRoleControllerValidator
                                            .asValidator(context),
                                      ),
                                    ]
                                        .divide(const SizedBox(height: 20.0))
                                        .around(const SizedBox(height: 20.0)),
                                  ),
                                ]
                                    .divide(const SizedBox(height: 10.0))
                                    .around(const SizedBox(height: 10.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 90.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Divider(
                              height: 1.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent3,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                if (_model.placePickerValue != null) {
                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    photoUrl: _model.uploadedFileUrl != ''
                                        ? _model.uploadedFileUrl
                                        : currentUserPhoto,
                                    displayName:
                                        _model.organizationNameController.text,
                                    userRole: _model.userRoleController.text,
                                    profileType: _model.choiceChipsValue,
                                    address: createAddressStruct(
                                      latLang: _model.placePickerValue.latLng,
                                      zipCode: _model.placePickerValue.zipCode,
                                      city: _model.placePickerValue.city,
                                      address: _model.placePickerValue.address,
                                      state: _model.placePickerValue.state,
                                      country: _model.placePickerValue.country,
                                      name: _model.placePickerValue.name,
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                } else {
                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    photoUrl: _model.uploadedFileUrl != ''
                                        ? _model.uploadedFileUrl
                                        : currentUserPhoto,
                                    displayName:
                                        _model.organizationNameController.text,
                                    userRole: _model.userRoleController.text,
                                    profileType: _model.choiceChipsValue,
                                  ));
                                }

                                context.pushNamed('homePage');
                              },
                              text: 'Continue',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.878,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.065,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
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
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
