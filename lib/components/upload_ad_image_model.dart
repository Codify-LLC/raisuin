import '/flutter_flow/flutter_flow_util.dart';
import 'upload_ad_image_widget.dart' show UploadAdImageWidget;
import 'package:flutter/material.dart';

class UploadAdImageModel extends FlutterFlowModel<UploadAdImageWidget> {
  ///  Local state fields for this component.

  String? imagePath;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
