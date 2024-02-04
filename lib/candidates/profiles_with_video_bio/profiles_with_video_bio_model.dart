import '/backend/backend.dart';
import '/components/navigation/navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profiles_with_video_bio_widget.dart' show ProfilesWithVideoBioWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProfilesWithVideoBioModel
    extends FlutterFlowModel<ProfilesWithVideoBioWidget> {
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

  List<UsersRecord> result = [];
  void addToResult(UsersRecord item) => result.add(item);
  void removeFromResult(UsersRecord item) => result.remove(item);
  void removeAtIndexFromResult(int index) => result.removeAt(index);
  void insertAtIndexInResult(int index, UsersRecord item) =>
      result.insert(index, item);
  void updateResultAtIndex(int index, Function(UsersRecord) updateFn) =>
      result[index] = updateFn(result[index]);

  bool filtered = false;

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
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // Model for navigation component.
  late NavigationModel navigationModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navigationModel = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in listViewStreamSubscriptions1) {
      s?.cancel();
    }
    listViewPagingController1?.dispose();

    for (var s in listViewStreamSubscriptions2) {
      s?.cancel();
    }
    listViewPagingController2?.dispose();

    navigationModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, UsersRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, UsersRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, UsersRecord> setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, UsersRecord> _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
