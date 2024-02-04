import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'schedule_interview_widget.dart' show ScheduleInterviewWidget;
import 'package:flutter/material.dart';

class ScheduleInterviewModel extends FlutterFlowModel<ScheduleInterviewWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for userRole widget.
  FocusNode? userRoleFocusNode;
  TextEditingController? userRoleController;
  String? Function(BuildContext, String?)? userRoleControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InterviewsRecord? interviewDoc;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userRoleFocusNode?.dispose();
    userRoleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
