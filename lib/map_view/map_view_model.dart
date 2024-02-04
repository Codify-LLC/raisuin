import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'map_view_widget.dart' show MapViewWidget;
import 'package:flutter/material.dart';

class MapViewModel extends FlutterFlowModel<MapViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetImageByteData)] action in mapView widget.
  ApiCallResponse? apiResultdqy;
  // State field(s) for stateDropdown widget.
  String? stateDropdownValue;
  FormFieldController<String>? stateDropdownValueController;
  // State field(s) for showCandidatesChoice widget.
  String? showCandidatesChoiceValue;
  FormFieldController<String>? showCandidatesChoiceValueController;
  // State field(s) for educationLevel widget.
  String? educationLevelValue;
  FormFieldController<String>? educationLevelValueController;
  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for experienceFrom widget.
  String? experienceFromValue;
  FormFieldController<String>? experienceFromValueController;
  // State field(s) for experienceTill widget.
  String? experienceTillValue;
  FormFieldController<String>? experienceTillValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
