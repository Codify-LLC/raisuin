// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future hiveCandidateAddSave(dynamic candidate) async {
  // Add your function code here!
  final candidatesSaveBox = await Hive.openBox('candidateSaved');
  final candidateId = candidate['candidateid'];
  if (!candidatesSaveBox.containsKey(candidateId)) {
    await candidatesSaveBox.put(candidateId, candidate);
  }
}
