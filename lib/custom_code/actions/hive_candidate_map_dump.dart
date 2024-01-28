// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future hiveCandidateMapDump(
  List<dynamic> candidateList,
  List<dynamic> videoCandidateList,
  List<dynamic> matchedCandidateList,
) async {
  // Add your function code here!
  final candidatesDumpBox = await Hive.openBox('candidatesDump');
  for (final candidate in candidateList) {
    final candidateId = candidate['candidateid'];
    if (!candidatesDumpBox.containsKey(candidateId)) {
      await candidatesDumpBox.put(candidateId, candidate);
    }
  }
  await candidatesDumpBox.close();

  // Open and populate the videocandidatesDump box
  final videocandidatesDumpBox = await Hive.openBox('videocandidatesDump');
  for (final candidate in videoCandidateList) {
    final candidateId = candidate['candidateid'];
    if (!videocandidatesDumpBox.containsKey(candidateId)) {
      await videocandidatesDumpBox.put(candidateId, candidate);
    }
  }
  await videocandidatesDumpBox.close();

  // Open and populate the matchedcandidates box
  final matchedcandidatesBox = await Hive.openBox('matchedcandidates');
  for (final candidate in matchedCandidateList) {
    final candidateId = candidate['candidateid'];
    if (!matchedcandidatesBox.containsKey(candidateId)) {
      // Use candidateId here
      await matchedcandidatesBox.put(candidateId, candidate);
    }
  }
  await matchedcandidatesBox.close();
}
