import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/upload_ad_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'post_ad_widget.dart' show PostAdWidget;
import 'package:flutter/material.dart';

class PostAdModel extends FlutterFlowModel<PostAdWidget> {
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

  InterviewMode? interviewType = InterviewMode.DIRECT;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for JobTitile widget.
  FocusNode? jobTitileFocusNode;
  TextEditingController? jobTitileController;
  String? Function(BuildContext, String?)? jobTitileControllerValidator;
  String? _jobTitileControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for requirementFor widget.
  String? requirementForValue;
  FormFieldController<List<String>>? requirementForValueController;
  // State field(s) for jobType widget.
  String? jobTypeValue;
  FormFieldController<List<String>>? jobTypeValueController;
  // State field(s) for Shift widget.
  String? shiftValue;
  FormFieldController<List<String>>? shiftValueController;
  // State field(s) for instituteName widget.
  FocusNode? instituteNameFocusNode;
  TextEditingController? instituteNameController;
  String? Function(BuildContext, String?)? instituteNameControllerValidator;
  String? _instituteNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Models for uploadAdImage dynamic component.
  late FlutterFlowDynamicModels<UploadAdImageModel> uploadAdImageModels;
  // State field(s) for from widget.
  FocusNode? fromFocusNode;
  TextEditingController? fromController;
  String? Function(BuildContext, String?)? fromControllerValidator;
  String? _fromControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for to widget.
  FocusNode? toFocusNode;
  TextEditingController? toController;
  String? Function(BuildContext, String?)? toControllerValidator;
  String? _toControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for JobLocation widget.
  var jobLocationValue = const FFPlace();
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // State field(s) for Subject widget.
  FocusNode? subjectFocusNode1;
  TextEditingController? subjectController1;
  String? Function(BuildContext, String?)? subjectController1Validator;
  // State field(s) for Subject widget.
  FocusNode? subjectFocusNode2;
  TextEditingController? subjectController2;
  String? Function(BuildContext, String?)? subjectController2Validator;
  // State field(s) for experiencechips widget.
  String? experiencechipsValue1;
  FormFieldController<List<String>>? experiencechipsValueController1;
  // State field(s) for experiencechips widget.
  String? experiencechipsValue2;
  FormFieldController<List<String>>? experiencechipsValueController2;
  // State field(s) for englishchips widget.
  String? englishchipsValue;
  FormFieldController<List<String>>? englishchipsValueController;
  // State field(s) for regionallanguageschips widget.
  List<String>? regionallanguageschipsValues;
  FormFieldController<List<String>>? regionallanguageschipsValueController;
  // State field(s) for timeChoiceChip widget.
  String? timeChoiceChipValue;
  FormFieldController<List<String>>? timeChoiceChipValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for totalVacancies widget.
  FocusNode? totalVacanciesFocusNode;
  TextEditingController? totalVacanciesController;
  String? Function(BuildContext, String?)? totalVacanciesControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AdsRecord? createdDoc;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    jobTitileControllerValidator = _jobTitileControllerValidator;
    instituteNameControllerValidator = _instituteNameControllerValidator;
    uploadAdImageModels = FlutterFlowDynamicModels(() => UploadAdImageModel());
    fromControllerValidator = _fromControllerValidator;
    toControllerValidator = _toControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    jobTitileFocusNode?.dispose();
    jobTitileController?.dispose();

    instituteNameFocusNode?.dispose();
    instituteNameController?.dispose();

    uploadAdImageModels.dispose();
    fromFocusNode?.dispose();
    fromController?.dispose();

    toFocusNode?.dispose();
    toController?.dispose();

    subjectFocusNode1?.dispose();
    subjectController1?.dispose();

    subjectFocusNode2?.dispose();
    subjectController2?.dispose();

    totalVacanciesFocusNode?.dispose();
    totalVacanciesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
