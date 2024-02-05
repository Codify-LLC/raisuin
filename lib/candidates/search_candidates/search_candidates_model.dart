import '/backend/backend.dart';
import '/components/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_candidates_widget.dart' show SearchCandidatesWidget;
import 'package:flutter/material.dart';

class SearchCandidatesModel extends FlutterFlowModel<SearchCandidatesWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> savedCandidates = [];
  void addToSavedCandidates(DocumentReference item) =>
      savedCandidates.add(item);
  void removeFromSavedCandidates(DocumentReference item) =>
      savedCandidates.remove(item);
  void removeAtIndexFromSavedCandidates(int index) =>
      savedCandidates.removeAt(index);
  void insertAtIndexInSavedCandidates(int index, DocumentReference item) =>
      savedCandidates.insert(index, item);
  void updateSavedCandidatesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      savedCandidates[index] = updateFn(savedCandidates[index]);

  bool showResults = false;

  bool filtered = false;

  List<DocumentReference> selectedCandidate = [];
  void addToSelectedCandidate(DocumentReference item) =>
      selectedCandidate.add(item);
  void removeFromSelectedCandidate(DocumentReference item) =>
      selectedCandidate.remove(item);
  void removeAtIndexFromSelectedCandidate(int index) =>
      selectedCandidate.removeAt(index);
  void insertAtIndexInSelectedCandidate(int index, DocumentReference item) =>
      selectedCandidate.insert(index, item);
  void updateSelectedCandidateAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedCandidate[index] = updateFn(selectedCandidate[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navigation component.
  late NavigationModel navigationModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navigationModel = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navigationModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
