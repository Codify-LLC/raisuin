import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/navigation/navigation_widget.dart';
import 'profile_employer_widget.dart' show ProfileEmployerWidget;
import 'package:flutter/material.dart';

class ProfileEmployerModel extends FlutterFlowModel<ProfileEmployerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navigation component.
  late NavigationModel navigationModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navigationModel = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navigationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
