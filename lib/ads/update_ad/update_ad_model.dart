import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_ad_widget.dart' show UpdateAdWidget;
import 'package:flutter/material.dart';

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

  List<Gender> gender = [];
  void addToGender(Gender item) => gender.add(item);
  void removeFromGender(Gender item) => gender.remove(item);
  void removeAtIndexFromGender(int index) => gender.removeAt(index);
  void insertAtIndexInGender(int index, Gender item) =>
      gender.insert(index, item);
  void updateGenderAtIndex(int index, Function(Gender) updateFn) =>
      gender[index] = updateFn(gender[index]);

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
  var jobLocationValue = const FFPlace();
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
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

  @override
  void initState(BuildContext context) {}

  @override
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
