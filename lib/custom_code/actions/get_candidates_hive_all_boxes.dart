// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_listener/hive_listener.dart';

Future<dynamic> getCandidatesHiveAllBoxes() async {
  // Add your function code here!
  final candidatesDumpBox = await Hive.openBox('candidatesDump');
  final videoCandidateBox = await Hive.openBox('videocandidatesDump');
  final matchedcandidateBox = await Hive.openBox('matchedcandidates');

  // // Initialize lists to store data from different boxes
  List<dynamic> candidates = [];
  List<dynamic> videoCandidates = [];
  List<dynamic> matchedCandidates = [];

  // // Read data from the 'candidatesDump' box
  for (final candidateId in candidatesDumpBox.keys) {
    final candidate = candidatesDumpBox.get(candidateId);
    candidates.add(candidate);
  }

  // Read data from the 'videoCandidateDump' box
  for (final candidateId in videoCandidateBox.keys) {
    final candidate = videoCandidateBox.get(candidateId);
    videoCandidates.add(candidate);
  }

  for (final candidateId in matchedcandidateBox.keys) {
    final candidate = matchedcandidateBox.get(candidateId);
    matchedCandidates.add(candidate);
  }

  // // Close the boxes when you're done reading the data
  await candidatesDumpBox.close();
  await videoCandidateBox.close();
  await matchedcandidateBox.close();

  return {
    'novideocandidates': candidates,
    'videoCandidates': videoCandidates,
    'matchedCandidates': matchedCandidates
  };
}
