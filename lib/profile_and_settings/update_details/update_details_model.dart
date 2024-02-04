import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_details_widget.dart' show UpdateDetailsWidget;
import 'package:flutter/material.dart';

class UpdateDetailsModel extends FlutterFlowModel<UpdateDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for organizationName widget.
  FocusNode? organizationNameFocusNode;
  TextEditingController? organizationNameController;
  String? Function(BuildContext, String?)? organizationNameControllerValidator;
  String? _organizationNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for userRole widget.
  FocusNode? userRoleFocusNode;
  TextEditingController? userRoleController;
  String? Function(BuildContext, String?)? userRoleControllerValidator;
  String? _userRoleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    organizationNameControllerValidator = _organizationNameControllerValidator;
    userRoleControllerValidator = _userRoleControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    organizationNameFocusNode?.dispose();
    organizationNameController?.dispose();

    userRoleFocusNode?.dispose();
    userRoleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
