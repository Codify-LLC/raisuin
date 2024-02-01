import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/update_or_delete_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'update_ad_widget.dart' show UpdateAdWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateAdModel extends FlutterFlowModel<UpdateAdWidget> {
  ///  Local state fields for this page.

  List<String> postionType = [];
  void addToPostionType(String item) => postionType.add(item);
  void removeFromPostionType(String item) => postionType.remove(item);
  void removeAtIndexFromPostionType(int index) => postionType.removeAt(index);
  void insertAtIndexInPostionType(int index, String item) =>
      postionType.insert(index, item);
  void updatePostionTypeAtIndex(int index, Function(String) updateFn) =>
      postionType[index] = updateFn(postionType[index]);

  String gender = 'Male';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in UpdateAd widget.
  AdsRecord? adref;
  // State field(s) for Position widget.
  String? positionValue;
  FormFieldController<List<String>>? positionValueController;
  // State field(s) for PositionTitle widget.
  FocusNode? positionTitleFocusNode;
  TextEditingController? positionTitleController;
  String? Function(BuildContext, String?)? positionTitleControllerValidator;
  // State field(s) for instituteName widget.
  FocusNode? instituteNameFocusNode;
  TextEditingController? instituteNameController;
  String? Function(BuildContext, String?)? instituteNameControllerValidator;
  // State field(s) for requirementFor widget.
  String? requirementForValue;
  FormFieldController<List<String>>? requirementForValueController;
  // State field(s) for jobType widget.
  String? jobTypeValue;
  FormFieldController<List<String>>? jobTypeValueController;
  // State field(s) for Shift widget.
  String? shiftValue;
  FormFieldController<List<String>>? shiftValueController;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for from widget.
  FocusNode? fromFocusNode;
  TextEditingController? fromController;
  String? Function(BuildContext, String?)? fromControllerValidator;
  // State field(s) for to widget.
  FocusNode? toFocusNode;
  TextEditingController? toController;
  String? Function(BuildContext, String?)? toControllerValidator;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for JobLocation widget.
  var jobLocationValue = FFPlace();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for level widget.
  String? levelValue;
  FormFieldController<String>? levelValueController;
  // State field(s) for degree widget.
  String? degreeValue;
  FormFieldController<String>? degreeValueController;
  // State field(s) for specialization widget.
  String? specializationValue;
  FormFieldController<String>? specializationValueController;
  // State field(s) for expfrom widget.
  FocusNode? expfromFocusNode;
  TextEditingController? expfromController;
  String? Function(BuildContext, String?)? expfromControllerValidator;
  // State field(s) for expto widget.
  FocusNode? exptoFocusNode;
  TextEditingController? exptoController;
  String? Function(BuildContext, String?)? exptoControllerValidator;
  // State field(s) for experiencechips widget.
  String? experiencechipsValue;
  FormFieldController<List<String>>? experiencechipsValueController;
  // State field(s) for englishchips widget.
  String? englishchipsValue;
  FormFieldController<List<String>>? englishchipsValueController;
  // State field(s) for regionallanguageschips widget.
  List<String>? regionallanguageschipsValues;
  FormFieldController<List<String>>? regionallanguageschipsValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    positionTitleFocusNode?.dispose();
    positionTitleController?.dispose();

    instituteNameFocusNode?.dispose();
    instituteNameController?.dispose();

    fromFocusNode?.dispose();
    fromController?.dispose();

    toFocusNode?.dispose();
    toController?.dispose();

    expfromFocusNode?.dispose();
    expfromController?.dispose();

    exptoFocusNode?.dispose();
    exptoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
