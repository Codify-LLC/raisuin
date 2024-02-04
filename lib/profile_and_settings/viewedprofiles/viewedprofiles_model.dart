import '/components/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'viewedprofiles_widget.dart' show ViewedprofilesWidget;
import 'package:flutter/material.dart';

class ViewedprofilesModel extends FlutterFlowModel<ViewedprofilesWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> selectedProfiles = [];
  void addToSelectedProfiles(DocumentReference item) =>
      selectedProfiles.add(item);
  void removeFromSelectedProfiles(DocumentReference item) =>
      selectedProfiles.remove(item);
  void removeAtIndexFromSelectedProfiles(int index) =>
      selectedProfiles.removeAt(index);
  void insertAtIndexInSelectedProfiles(int index, DocumentReference item) =>
      selectedProfiles.insert(index, item);
  void updateSelectedProfilesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedProfiles[index] = updateFn(selectedProfiles[index]);

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
