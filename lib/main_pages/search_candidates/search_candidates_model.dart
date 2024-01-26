import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/navigation/navigation_widget.dart';
import '/recruiter/recruiter_profiles/send_message/send_message_widget.dart';
import '/recruiter/send_email_message/send_email_message_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_candidates_widget.dart' show SearchCandidatesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navigationModel = createModel(context, () => NavigationModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navigationModel.dispose();
    textFieldFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
