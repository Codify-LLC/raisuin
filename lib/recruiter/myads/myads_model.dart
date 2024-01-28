import '/flutter_flow/flutter_flow_util.dart';
import 'myads_widget.dart' show MyadsWidget;
import 'package:flutter/material.dart';

class MyadsModel extends FlutterFlowModel<MyadsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
