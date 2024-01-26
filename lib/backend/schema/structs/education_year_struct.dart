// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EducationYearStruct extends FFFirebaseStruct {
  EducationYearStruct({
    DateTime? from,
    DateTime? to,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _from = from,
        _to = to,
        super(firestoreUtilData);

  // "from" field.
  DateTime? _from;
  DateTime? get from => _from;
  set from(DateTime? val) => _from = val;
  bool hasFrom() => _from != null;

  // "to" field.
  DateTime? _to;
  DateTime? get to => _to;
  set to(DateTime? val) => _to = val;
  bool hasTo() => _to != null;

  static EducationYearStruct fromMap(Map<String, dynamic> data) =>
      EducationYearStruct(
        from: data['from'] as DateTime?,
        to: data['to'] as DateTime?,
      );

  static EducationYearStruct? maybeFromMap(dynamic data) => data is Map
      ? EducationYearStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'from': _from,
        'to': _to,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'from': serializeParam(
          _from,
          ParamType.DateTime,
        ),
        'to': serializeParam(
          _to,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static EducationYearStruct fromSerializableMap(Map<String, dynamic> data) =>
      EducationYearStruct(
        from: deserializeParam(
          data['from'],
          ParamType.DateTime,
          false,
        ),
        to: deserializeParam(
          data['to'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'EducationYearStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EducationYearStruct && from == other.from && to == other.to;
  }

  @override
  int get hashCode => const ListEquality().hash([from, to]);
}

EducationYearStruct createEducationYearStruct({
  DateTime? from,
  DateTime? to,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EducationYearStruct(
      from: from,
      to: to,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EducationYearStruct? updateEducationYearStruct(
  EducationYearStruct? educationYear, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    educationYear
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEducationYearStructData(
  Map<String, dynamic> firestoreData,
  EducationYearStruct? educationYear,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (educationYear == null) {
    return;
  }
  if (educationYear.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && educationYear.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final educationYearData =
      getEducationYearFirestoreData(educationYear, forFieldValue);
  final nestedData =
      educationYearData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = educationYear.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEducationYearFirestoreData(
  EducationYearStruct? educationYear, [
  bool forFieldValue = false,
]) {
  if (educationYear == null) {
    return {};
  }
  final firestoreData = mapToFirestore(educationYear.toMap());

  // Add any Firestore field values
  educationYear.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEducationYearListFirestoreData(
  List<EducationYearStruct>? educationYears,
) =>
    educationYears
        ?.map((e) => getEducationYearFirestoreData(e, true))
        .toList() ??
    [];
