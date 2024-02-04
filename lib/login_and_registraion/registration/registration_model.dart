import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'registration_widget.dart' show RegistrationWidget;
import 'package:flutter/material.dart';

class RegistrationModel extends FlutterFlowModel<RegistrationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  String? _displayNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for profileType widget.
  String? profileTypeValue;
  FormFieldController<List<String>>? profileTypeValueController;
  // State field(s) for schoolName widget.
  FocusNode? schoolNameFocusNode;
  TextEditingController? schoolNameController;
  String? Function(BuildContext, String?)? schoolNameControllerValidator;
  String? _schoolNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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

  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    displayNameControllerValidator = _displayNameControllerValidator;
    schoolNameControllerValidator = _schoolNameControllerValidator;
    userRoleControllerValidator = _userRoleControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    displayNameFocusNode?.dispose();
    displayNameController?.dispose();

    schoolNameFocusNode?.dispose();
    schoolNameController?.dispose();

    userRoleFocusNode?.dispose();
    userRoleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
