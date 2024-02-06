import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String selectPackage = '15Days';

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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Reverse Geocoding)] action in homePage widget.
  ApiCallResponse? reverseGecodingResult;
  InstantTimer? instantTimer;
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatsRecord>? alldocs;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? createdChat;
  // State field(s) for experiencechips widget.
  List<String>? experiencechipsValues;
  FormFieldController<List<String>>? experiencechipsValueController;
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
    instantTimer?.cancel();
    navigationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
