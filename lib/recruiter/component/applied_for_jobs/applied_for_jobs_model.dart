import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'applied_for_jobs_widget.dart' show AppliedForJobsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
