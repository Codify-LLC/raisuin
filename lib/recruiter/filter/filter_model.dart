import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_widget.dart' show FilterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterModel extends FlutterFlowModel<FilterWidget> {
  ///  Local state fields for this component.

  List<String> gender = [];
  void addToGender(String item) => gender.add(item);
  void removeFromGender(String item) => gender.remove(item);
  void removeAtIndexFromGender(int index) => gender.removeAt(index);
  void insertAtIndexInGender(int index, String item) =>
      gender.insert(index, item);
  void updateGenderAtIndex(int index, Function(String) updateFn) =>
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
  // State field(s) for expfrom widget.
  FocusNode? expfromFocusNode;
  TextEditingController? expfromController;
  String? Function(BuildContext, String?)? expfromControllerValidator;
  // State field(s) for expto widget.
  FocusNode? exptoFocusNode;
  TextEditingController? exptoController;
  String? Function(BuildContext, String?)? exptoControllerValidator;
  // State field(s) for salarymin widget.
  FocusNode? salaryminFocusNode;
  TextEditingController? salaryminController;
  String? Function(BuildContext, String?)? salaryminControllerValidator;
  // State field(s) for salarytill widget.
  FocusNode? salarytillFocusNode;
  TextEditingController? salarytillController;
  String? Function(BuildContext, String?)? salarytillControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    expfromFocusNode?.dispose();
    expfromController?.dispose();

    exptoFocusNode?.dispose();
    exptoController?.dispose();

    salaryminFocusNode?.dispose();
    salaryminController?.dispose();

    salarytillFocusNode?.dispose();
    salarytillController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
