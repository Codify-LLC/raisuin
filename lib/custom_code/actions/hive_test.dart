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

Future<List<String>> hiveTest(String string) async {
  // Add your function code here!
  final box = await Hive.openBox<String>('test');

  // Add the string value to the box
  await box.add(string);

  // Retrieve all strings present in the box
  final List<String> strings = box.values.toList();

  // Close the box when done
  await box.close();

  return strings;
}
