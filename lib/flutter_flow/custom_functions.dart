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

dynamic buildEmailJson(
  String recruiterName,
  String mailMessge,
) {
  dynamic output = {"content": mailMessge, "recruiterName": recruiterName};
  return output;
}

List<dynamic> markerCandiList(
  String showCandidates,
  List<dynamic> videoCandi,
  List<dynamic> noVideoCandi,
  List<dynamic> matchCandi,
  String gender,
  String eduLevel,
  String state,
) {
  List<dynamic> filterCandi = [];
  List<dynamic> candidateMaster = [];
  candidateMaster.addAll(videoCandi);
  candidateMaster.addAll(noVideoCandi);
  candidateMaster.addAll(matchCandi);

  Set<String> uniqueCandidateIds = Set<String>();
  List<dynamic> uniqueCandi = [];

  for (final candidate in candidateMaster) {
    final String candidateId = candidate['candidateid'];
    // Check if the candidateid is unique
    if (uniqueCandidateIds.add(candidateId)) {
      uniqueCandi.add(candidate);
    }
  }

  if (showCandidates == "all") {
    filterCandi = uniqueCandi;
  } else if (showCandidates == "matched") {
    Set<String> uniqueMatchedCandidateIds = Set<String>();
    List<dynamic> uniqueMatchedCandi = [];

    for (final candidate in matchCandi) {
      final String candidateId = candidate['candidateid'];
      // Check if the candidateid is unique
      if (uniqueMatchedCandidateIds.add(candidateId)) {
        uniqueMatchedCandi.add(candidate);
      }
    }

    filterCandi = uniqueMatchedCandi;
  }

  if (gender != "all") {
    filterCandi = filterCandi
        .where((candidate) => candidate['gender'] == gender)
        .toList();
  }

  if (eduLevel != "all") {
    filterCandi = filterCandi
        .where((candidate) =>
            candidate['edulevel'] == eduLevel ||
            candidate['highesteducationlevel'] == eduLevel)
        .toList();
  }

  return filterCandi;
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

DateTime returnDates(int numberOfDays) {
  // write a function that takes numberOfDays and return the date which is after numberOfDays
  final now = DateTime.now();
  final futureDate = now.add(Duration(days: numberOfDays));
  return futureDate;
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
