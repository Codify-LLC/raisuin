import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int dateStringAgeCalculator(String date) {
  DateTime now = DateTime.now();
  DateTime dob;
  try {
    dob = DateTime.parse(date);
  } catch (error) {
    dob = DateTime.now();
  }
  int age = now.year - dob.year;
  if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
    age--;
  }
  return age;
}

DateTime futureDateTime(
  DateTime time,
  int months,
  int days,
  int hours,
  int minutes,
  int seconds,
) {
  // add to time and return future datetime
  final newTime = time.add(Duration(
    days: days,
    hours: hours,
    minutes: minutes,
    seconds: seconds,
  ));
  final year = newTime.year;
  final month = newTime.month + months;
  final day = newTime.day;
  final hour = newTime.hour;
  final minute = newTime.minute;
  final second = newTime.second;
  return DateTime(year, month, day, hour, minute, second);
}

List<String> replaceImageFromIndex(
  List<String> images,
  int index,
  String newImage,
) {
  // write a function that replaces the item in list images at index with newImage
  images[index] = newImage;
  return List.from(images);
}

String listToString(List<String> listOfStrings) {
  // write a function that adds all the list item in the string with comma saperated
  return listOfStrings.join(',');
}

List<DocumentReference>? addUsersInList(
  DocumentReference user1,
  DocumentReference user2,
) {
  return [user1, user2];
}

String returnEmptyVideoPath() {
  return '';
}

List<String> removeImageFromIndex(
  List<String> images,
  int index,
) {
  // write a function that removes the list item from index value
  images.removeAt(index);
  return images;
}

List<UsersRecord> joinToUserRefList(
  List<UsersRecord> list1,
  List<UsersRecord> list2,
) {
  // return a list by concatinating the list1 and list2
  return [...list1, ...list2];
}

List<String> allTypesOfDegreeLevels() {
  return [
    'Undergraduate',
    'Associate',
    'Bachelor\'s',
    'Master\'s',
    'Doctorate',
    'Professional',
  ];
}

int calculateNumberOfYears(FromToDateTimeStruct date) {
  // calculate number of years from and to datetime
  DateTime fromDate = date.from!;
  DateTime toDate = date.to!;
  int years = toDate.year - fromDate.year;
  if (toDate.month < fromDate.month ||
      (toDate.month == fromDate.month && toDate.day < fromDate.day)) {
    years--;
  }
  return years;
}

List<String> getSearchParameterList(List<ChatsRecord> chats) {
  // generate a list of UserName and UserEmail form users field which has chatUsers data type
  List<String> searchParameters = [];

  for (final chat in chats) {
    for (final user in chat.users) {
      searchParameters.add(user.userName);
      searchParameters.add(user.userEmail);
    }
  }

  return searchParameters;
}
