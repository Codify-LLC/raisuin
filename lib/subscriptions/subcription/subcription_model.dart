import '/flutter_flow/flutter_flow_util.dart';
import 'subcription_widget.dart' show SubcriptionWidget;
import 'package:flutter/material.dart';

class SubcriptionModel extends FlutterFlowModel<SubcriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [RevenueCat - Purchase] action in Column widget.
  bool? purchase;

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