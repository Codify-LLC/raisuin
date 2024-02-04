import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_or_delete_widget.dart' show UpdateOrDeleteWidget;
import 'package:flutter/material.dart';

class UpdateOrDeleteModel extends FlutterFlowModel<UpdateOrDeleteWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  AdsRecord? adref;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
