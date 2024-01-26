import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'schedule_interview_widget.dart' show ScheduleInterviewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {}

  void dispose() {
    userRoleFocusNode?.dispose();
    userRoleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
