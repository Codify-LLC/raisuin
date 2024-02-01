// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkExperienceStruct extends FFFirebaseStruct {
  WorkExperienceStruct({
    String? positionTitle,
    String? company,
    String? description,
    FromToDateTimeStruct? duration,
    bool? currentlyWorkingHere,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _positionTitle = positionTitle,
        _company = company,
        _description = description,
        _duration = duration,
        _currentlyWorkingHere = currentlyWorkingHere,
        super(firestoreUtilData);

  // "positionTitle" field.
  String? _positionTitle;
  String get positionTitle => _positionTitle ?? '';
  set positionTitle(String? val) => _positionTitle = val;
  bool hasPositionTitle() => _positionTitle != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  set company(String? val) => _company = val;
  bool hasCompany() => _company != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "duration" field.
  FromToDateTimeStruct? _duration;
  FromToDateTimeStruct get duration => _duration ?? FromToDateTimeStruct();
  set duration(FromToDateTimeStruct? val) => _duration = val;
  void updateDuration(Function(FromToDateTimeStruct) updateFn) =>
      updateFn(_duration ??= FromToDateTimeStruct());
  bool hasDuration() => _duration != null;

  // "currentlyWorkingHere" field.
  bool? _currentlyWorkingHere;
  bool get currentlyWorkingHere => _currentlyWorkingHere ?? false;
  set currentlyWorkingHere(bool? val) => _currentlyWorkingHere = val;
  bool hasCurrentlyWorkingHere() => _currentlyWorkingHere != null;

  static WorkExperienceStruct fromMap(Map<String, dynamic> data) =>
      WorkExperienceStruct(
        positionTitle: data['positionTitle'] as String?,
        company: data['company'] as String?,
        description: data['description'] as String?,
        duration: FromToDateTimeStruct.maybeFromMap(data['duration']),
        currentlyWorkingHere: data['currentlyWorkingHere'] as bool?,
      );

  static WorkExperienceStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkExperienceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'positionTitle': _positionTitle,
        'company': _company,
        'description': _description,
        'duration': _duration?.toMap(),
        'currentlyWorkingHere': _currentlyWorkingHere,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'positionTitle': serializeParam(
          _positionTitle,
          ParamType.String,
        ),
        'company': serializeParam(
          _company,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.DataStruct,
        ),
        'currentlyWorkingHere': serializeParam(
          _currentlyWorkingHere,
          ParamType.bool,
        ),
      }.withoutNulls;

  static WorkExperienceStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkExperienceStruct(
        positionTitle: deserializeParam(
          data['positionTitle'],
          ParamType.String,
          false,
        ),
        company: deserializeParam(
          data['company'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        duration: deserializeStructParam(
          data['duration'],
          ParamType.DataStruct,
          false,
          structBuilder: FromToDateTimeStruct.fromSerializableMap,
        ),
        currentlyWorkingHere: deserializeParam(
          data['currentlyWorkingHere'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'WorkExperienceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkExperienceStruct &&
        positionTitle == other.positionTitle &&
        company == other.company &&
        description == other.description &&
        duration == other.duration &&
        currentlyWorkingHere == other.currentlyWorkingHere;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [positionTitle, company, description, duration, currentlyWorkingHere]);
}

WorkExperienceStruct createWorkExperienceStruct({
  String? positionTitle,
  String? company,
  String? description,
  FromToDateTimeStruct? duration,
  bool? currentlyWorkingHere,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkExperienceStruct(
      positionTitle: positionTitle,
      company: company,
      description: description,
      duration: duration ?? (clearUnsetFields ? FromToDateTimeStruct() : null),
      currentlyWorkingHere: currentlyWorkingHere,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkExperienceStruct? updateWorkExperienceStruct(
  WorkExperienceStruct? workExperience, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workExperience
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkExperienceStructData(
  Map<String, dynamic> firestoreData,
  WorkExperienceStruct? workExperience,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workExperience == null) {
    return;
  }
  if (workExperience.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workExperience.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workExperienceData =
      getWorkExperienceFirestoreData(workExperience, forFieldValue);
  final nestedData =
      workExperienceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workExperience.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkExperienceFirestoreData(
  WorkExperienceStruct? workExperience, [
  bool forFieldValue = false,
]) {
  if (workExperience == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workExperience.toMap());

  // Handle nested data for "duration" field.
  addFromToDateTimeStructData(
    firestoreData,
    workExperience.hasDuration() ? workExperience.duration : null,
    'duration',
    forFieldValue,
  );

  // Add any Firestore field values
  workExperience.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkExperienceListFirestoreData(
  List<WorkExperienceStruct>? workExperiences,
) =>
    workExperiences
        ?.map((e) => getWorkExperienceFirestoreData(e, true))
        .toList() ??
    [];
