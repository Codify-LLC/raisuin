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

Future<List<ChatsRecord>> chatSearch(
  String input,
  List<ChatsRecord> chatDocuments,
) async {
  // search using input in chat documents in users field containing list of Chat User data type
  List<ChatsRecord> searchResults = [];

  for (ChatsRecord chat in chatDocuments) {
    for (final user in chat.users) {
      if (user.userName.toLowerCase().contains(input.toLowerCase())) {
        searchResults.add(chat);
      } else if (user.userEmail.toLowerCase().contains(input.toLowerCase())) {
        searchResults.add(chat);
      }
    }
  }

  return searchResults;
}
