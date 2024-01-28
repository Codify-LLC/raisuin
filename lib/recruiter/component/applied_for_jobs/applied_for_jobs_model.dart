import '/flutter_flow/flutter_flow_util.dart';
import 'applied_for_jobs_widget.dart' show AppliedForJobsWidget;
import 'package:flutter/material.dart';

class AppliedForJobsModel extends FlutterFlowModel<AppliedForJobsWidget> {
  ///  Local state fields for this component.

  List<String> candidateSelected = [];
  void addToCandidateSelected(String item) => candidateSelected.add(item);
  void removeFromCandidateSelected(String item) =>
      candidateSelected.remove(item);
  void removeAtIndexFromCandidateSelected(int index) =>
      candidateSelected.removeAt(index);
  void insertAtIndexInCandidateSelected(int index, String item) =>
      candidateSelected.insert(index, item);
  void updateCandidateSelectedAtIndex(int index, Function(String) updateFn) =>
      candidateSelected[index] = updateFn(candidateSelected[index]);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
