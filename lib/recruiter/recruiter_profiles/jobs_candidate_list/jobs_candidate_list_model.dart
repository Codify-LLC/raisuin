import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/navigation/navigation_widget.dart';
import '/recruiter/recruiter_profiles/send_message/send_message_widget.dart';
import '/recruiter/send_email_message/send_email_message_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'jobs_candidate_list_widget.dart' show JobsCandidateListWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class JobsCandidateListModel extends FlutterFlowModel<JobsCandidateListWidget> {
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

  void initState(BuildContext context) {
    navigationModel = createModel(context, () => NavigationModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navigationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
