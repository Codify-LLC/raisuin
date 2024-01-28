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

Future hiveConnect() async {
  // Add your function code here!
  await Hive.initFlutter();
  // final candidatesDumpBox = await Hive.openBox('candidatesDump');
  // final videoCandidateBox = await Hive.openBox('videocandidatesDump');
  // final matchedcandidateBox = await Hive.openBox('matchedcandidates');
  // await candidatesDumpBox.close();
  // await videoCandidateBox.close();
  // await matchedcandidateBox.close();
}