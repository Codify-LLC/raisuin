import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_widget.dart' show FilterWidget;
import 'package:flutter/material.dart';

class FilterModel extends FlutterFlowModel<FilterWidget> {
  ///  Local state fields for this component.

  List<Gender> gender = [];
  void addToGender(Gender item) => gender.add(item);
  void removeFromGender(Gender item) => gender.remove(item);
  void removeAtIndexFromGender(int index) => gender.removeAt(index);
  void insertAtIndexInGender(int index, Gender item) =>
      gender.insert(index, item);
  void updateGenderAtIndex(int index, Function(Gender) updateFn) =>
      gender[index] = updateFn(gender[index]);

  bool jobtype = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for level widget.
  String? levelValue;
  FormFieldController<String>? levelValueController;
  // State field(s) for degree widget.
  String? degreeValue;
  FormFieldController<String>? degreeValueController;
  // State field(s) for subject widget.
  String? subjectValue;
  FormFieldController<String>? subjectValueController;
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // State field(s) for Age widget.
  double? ageValue;
  // State field(s) for requirementFor widget.
  String? requirementForValue;
  FormFieldController<List<String>>? requirementForValueController;
  // State field(s) for salarymin widget.
  FocusNode? salaryminFocusNode;
  TextEditingController? salaryminController;
  String? Function(BuildContext, String?)? salaryminControllerValidator;
  // State field(s) for salarytill widget.
  FocusNode? salarytillFocusNode;
  TextEditingController? salarytillController;
  String? Function(BuildContext, String?)? salarytillControllerValidator;
  // State field(s) for regionalLanguage widget.
  List<String>? regionalLanguageValues;
  FormFieldController<List<String>>? regionalLanguageValueController;
  // State field(s) for englishLevel widget.
  String? englishLevelValue;
  FormFieldController<List<String>>? englishLevelValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    salaryminFocusNode?.dispose();
    salaryminController?.dispose();

    salarytillFocusNode?.dispose();
    salarytillController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
