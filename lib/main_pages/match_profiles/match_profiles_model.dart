import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/navigation/navigation_widget.dart';
import 'match_profiles_widget.dart' show MatchProfilesWidget;
import 'package:flutter/material.dart';

class MatchProfilesModel extends FlutterFlowModel<MatchProfilesWidget> {
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

  List<UsersRecord> result = [];
  void addToResult(UsersRecord item) => result.add(item);
  void removeFromResult(UsersRecord item) => result.remove(item);
  void removeAtIndexFromResult(int index) => result.removeAt(index);
  void insertAtIndexInResult(int index, UsersRecord item) =>
      result.insert(index, item);
  void updateResultAtIndex(int index, Function(UsersRecord) updateFn) =>
      result[index] = updateFn(result[index]);

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

  int loop = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in MatchProfiles widget.
  List<AdsRecord>? allAds;
  // Stores action output result for [Firestore Query - Query a collection] action in MatchProfiles widget.
  List<UsersRecord>? allusers;
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
