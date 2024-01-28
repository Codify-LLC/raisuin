import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/navigation/navigation_widget.dart';
import 'savedprofile_widget.dart' show SavedprofileWidget;
import 'package:flutter/material.dart';

class SavedprofileModel extends FlutterFlowModel<SavedprofileWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> selectedCandidates = [];
  void addToSelectedCandidates(DocumentReference item) =>
      selectedCandidates.add(item);
  void removeFromSelectedCandidates(DocumentReference item) =>
      selectedCandidates.remove(item);
  void removeAtIndexFromSelectedCandidates(int index) =>
      selectedCandidates.removeAt(index);
  void insertAtIndexInSelectedCandidates(int index, DocumentReference item) =>
      selectedCandidates.insert(index, item);
  void updateSelectedCandidatesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedCandidates[index] = updateFn(selectedCandidates[index]);

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
