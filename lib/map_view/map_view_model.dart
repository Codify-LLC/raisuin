import '/backend/backend.dart';
import '/components/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'map_view_widget.dart' show MapViewWidget;
import 'package:flutter/material.dart';

class MapViewModel extends FlutterFlowModel<MapViewWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> candidateList = [];
  void addToCandidateList(UsersRecord item) => candidateList.add(item);
  void removeFromCandidateList(UsersRecord item) => candidateList.remove(item);
  void removeAtIndexFromCandidateList(int index) =>
      candidateList.removeAt(index);
  void insertAtIndexInCandidateList(int index, UsersRecord item) =>
      candidateList.insert(index, item);
  void updateCandidateListAtIndex(int index, Function(UsersRecord) updateFn) =>
      candidateList[index] = updateFn(candidateList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for stateDropdown widget.
  String? stateDropdownValue;
  FormFieldController<String>? stateDropdownValueController;
  // State field(s) for showCandidatesChoice widget.
  String? showCandidatesChoiceValue;
  FormFieldController<String>? showCandidatesChoiceValueController;
  // State field(s) for educationLevel widget.
  String? educationLevelValue;
  FormFieldController<String>? educationLevelValueController;
  // State field(s) for gender widget.
  List<String>? genderValue;
  FormFieldController<List<String>>? genderValueController;
  // State field(s) for experienceFrom widget.
  String? experienceFromValue;
  FormFieldController<String>? experienceFromValueController;
  // State field(s) for experienceTill widget.
  String? experienceTillValue;
  FormFieldController<String>? experienceTillValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatsRecord>? alldocs;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? createdChat;
  // State field(s) for DoNotDelete widget.
  LatLng? doNotDeletesCenter;
  final doNotDeletesController = Completer<GoogleMapController>();
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
