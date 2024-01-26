import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'map_view_widget.dart' show MapViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapViewModel extends FlutterFlowModel<MapViewWidget> {
  ///  Local state fields for this page.

  List<LatLng> latlangs = [];
  void addToLatlangs(LatLng item) => latlangs.add(item);
  void removeFromLatlangs(LatLng item) => latlangs.remove(item);
  void removeAtIndexFromLatlangs(int index) => latlangs.removeAt(index);
  void insertAtIndexInLatlangs(int index, LatLng item) =>
      latlangs.insert(index, item);
  void updateLatlangsAtIndex(int index, Function(LatLng) updateFn) =>
      latlangs[index] = updateFn(latlangs[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in mapView widget.
  List<UsersRecord>? user;
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
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for experienceFrom widget.
  String? experienceFromValue;
  FormFieldController<String>? experienceFromValueController;
  // State field(s) for experienceTill widget.
  String? experienceTillValue;
  FormFieldController<String>? experienceTillValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
