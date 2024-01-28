import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'send_message_widget.dart' show SendMessageWidget;
import 'package:flutter/material.dart';

class SendMessageModel extends FlutterFlowModel<SendMessageWidget> {
  ///  Local state fields for this component.

  int loop = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatsRecord>? alldocs;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? createdChat;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
