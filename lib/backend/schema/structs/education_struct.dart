// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EducationStruct extends FFFirebaseStruct {
  EducationStruct({
    String? educationType,
    String? degree,
    String? subject,
    String? collegeName,
    EducationYearStruct? year,
    bool? primary,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _educationType = educationType,
        _degree = degree,
        _subject = subject,
        _collegeName = collegeName,
        _year = year,
        _primary = primary,
        super(firestoreUtilData);

  // "educationType" field.
  String? _educationType;
  String get educationType => _educationType ?? '';
  set educationType(String? val) => _educationType = val;
  bool hasEducationType() => _educationType != null;

  // "degree" field.
  String? _degree;
  String get degree => _degree ?? '';
  set degree(String? val) => _degree = val;
  bool hasDegree() => _degree != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;
  bool hasSubject() => _subject != null;

  // "collegeName" field.
  String? _collegeName;
  String get collegeName => _collegeName ?? '';
  set collegeName(String? val) => _collegeName = val;
  bool hasCollegeName() => _collegeName != null;

  // "year" field.
  EducationYearStruct? _year;
  EducationYearStruct get year => _year ?? EducationYearStruct();
  set year(EducationYearStruct? val) => _year = val;
  void updateYear(Function(EducationYearStruct) updateFn) =>
      updateFn(_year ??= EducationYearStruct());
  bool hasYear() => _year != null;

  // "primary" field.
  bool? _primary;
  bool get primary => _primary ?? false;
  set primary(bool? val) => _primary = val;
  bool hasPrimary() => _primary != null;

  static EducationStruct fromMap(Map<String, dynamic> data) => EducationStruct(
        educationType: data['educationType'] as String?,
        degree: data['degree'] as String?,
        subject: data['subject'] as String?,
        collegeName: data['collegeName'] as String?,
        year: EducationYearStruct.maybeFromMap(data['year']),
        primary: data['primary'] as bool?,
      );

  static EducationStruct? maybeFromMap(dynamic data) => data is Map
      ? EducationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'educationType': _educationType,
        'degree': _degree,
        'subject': _subject,
        'collegeName': _collegeName,
        'year': _year?.toMap(),
        'primary': _primary,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'educationType': serializeParam(
          _educationType,
          ParamType.String,
        ),
        'degree': serializeParam(
          _degree,
          ParamType.String,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'collegeName': serializeParam(
          _collegeName,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.DataStruct,
        ),
        'primary': serializeParam(
          _primary,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EducationStruct fromSerializableMap(Map<String, dynamic> data) =>
      EducationStruct(
        educationType: deserializeParam(
          data['educationType'],
          ParamType.String,
          false,
        ),
        degree: deserializeParam(
          data['degree'],
          ParamType.String,
          false,
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        collegeName: deserializeParam(
          data['collegeName'],
          ParamType.String,
          false,
        ),
        year: deserializeStructParam(
          data['year'],
          ParamType.DataStruct,
          false,
          structBuilder: EducationYearStruct.fromSerializableMap,
        ),
        primary: deserializeParam(
          data['primary'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'EducationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EducationStruct &&
        educationType == other.educationType &&
        degree == other.degree &&
        subject == other.subject &&
        collegeName == other.collegeName &&
        year == other.year &&
        primary == other.primary;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([educationType, degree, subject, collegeName, year, primary]);
}

EducationStruct createEducationStruct({
  String? educationType,
  String? degree,
  String? subject,
  String? collegeName,
  EducationYearStruct? year,
  bool? primary,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EducationStruct(
      educationType: educationType,
      degree: degree,
      subject: subject,
      collegeName: collegeName,
      year: year ?? (clearUnsetFields ? EducationYearStruct() : null),
      primary: primary,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EducationStruct? updateEducationStruct(
  EducationStruct? education, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    education
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEducationStructData(
  Map<String, dynamic> firestoreData,
  EducationStruct? education,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (education == null) {
    return;
  }
  if (education.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && education.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final educationData = getEducationFirestoreData(education, forFieldValue);
  final nestedData = educationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = education.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEducationFirestoreData(
  EducationStruct? education, [
  bool forFieldValue = false,
]) {
  if (education == null) {
    return {};
  }
  final firestoreData = mapToFirestore(education.toMap());

  // Handle nested data for "year" field.
  addEducationYearStructData(
    firestoreData,
    education.hasYear() ? education.year : null,
    'year',
    forFieldValue,
  );

  // Add any Firestore field values
  education.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEducationListFirestoreData(
  List<EducationStruct>? educations,
) =>
    educations?.map((e) => getEducationFirestoreData(e, true)).toList() ?? [];
