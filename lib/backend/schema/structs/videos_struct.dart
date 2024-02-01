// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VideosStruct extends FFFirebaseStruct {
  VideosStruct({
    String? title,
    String? video,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _video = video,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;
  bool hasVideo() => _video != null;

  static VideosStruct fromMap(Map<String, dynamic> data) => VideosStruct(
        title: data['title'] as String?,
        video: data['video'] as String?,
      );

  static VideosStruct? maybeFromMap(dynamic data) =>
      data is Map ? VideosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'video': _video,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideosStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideosStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideosStruct &&
        title == other.title &&
        video == other.video;
  }

  @override
  int get hashCode => const ListEquality().hash([title, video]);
}

VideosStruct createVideosStruct({
  String? title,
  String? video,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VideosStruct(
      title: title,
      video: video,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VideosStruct? updateVideosStruct(
  VideosStruct? videos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    videos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVideosStructData(
  Map<String, dynamic> firestoreData,
  VideosStruct? videos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (videos == null) {
    return;
  }
  if (videos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && videos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final videosData = getVideosFirestoreData(videos, forFieldValue);
  final nestedData = videosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = videos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVideosFirestoreData(
  VideosStruct? videos, [
  bool forFieldValue = false,
]) {
  if (videos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(videos.toMap());

  // Add any Firestore field values
  videos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVideosListFirestoreData(
  List<VideosStruct>? videoss,
) =>
    videoss?.map((e) => getVideosFirestoreData(e, true)).toList() ?? [];
