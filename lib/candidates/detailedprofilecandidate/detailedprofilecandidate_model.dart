import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detailedprofilecandidate_widget.dart'
    show DetailedprofilecandidateWidget;
import 'package:flutter/material.dart';

class DetailedprofilecandidateModel
    extends FlutterFlowModel<DetailedprofilecandidateWidget> {
  ///  Local state fields for this page.

  int? integer = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatsRecord>? alldocs;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? createdChat;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
