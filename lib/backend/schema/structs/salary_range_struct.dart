// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SalaryRangeStruct extends FFFirebaseStruct {
  SalaryRangeStruct({
    int? from,
    int? to,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _from = from,
        _to = to,
        super(firestoreUtilData);

  // "from" field.
  int? _from;
  int get from => _from ?? 0;
  set from(int? val) => _from = val;
  void incrementFrom(int amount) => _from = from + amount;
  bool hasFrom() => _from != null;

  // "to" field.
  int? _to;
  int get to => _to ?? 0;
  set to(int? val) => _to = val;
  void incrementTo(int amount) => _to = to + amount;
  bool hasTo() => _to != null;

  static SalaryRangeStruct fromMap(Map<String, dynamic> data) =>
      SalaryRangeStruct(
        from: castToType<int>(data['from']),
        to: castToType<int>(data['to']),
      );

  static SalaryRangeStruct? maybeFromMap(dynamic data) => data is Map
      ? SalaryRangeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'from': _from,
        'to': _to,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'from': serializeParam(
          _from,
          ParamType.int,
        ),
        'to': serializeParam(
          _to,
          ParamType.int,
        ),
      }.withoutNulls;

  static SalaryRangeStruct fromSerializableMap(Map<String, dynamic> data) =>
      SalaryRangeStruct(
        from: deserializeParam(
          data['from'],
          ParamType.int,
          false,
        ),
        to: deserializeParam(
          data['to'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SalaryRangeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SalaryRangeStruct && from == other.from && to == other.to;
  }

  @override
  int get hashCode => const ListEquality().hash([from, to]);
}

SalaryRangeStruct createSalaryRangeStruct({
  int? from,
  int? to,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SalaryRangeStruct(
      from: from,
      to: to,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SalaryRangeStruct? updateSalaryRangeStruct(
  SalaryRangeStruct? salaryRange, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    salaryRange
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSalaryRangeStructData(
  Map<String, dynamic> firestoreData,
  SalaryRangeStruct? salaryRange,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (salaryRange == null) {
    return;
  }
  if (salaryRange.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && salaryRange.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final salaryRangeData =
      getSalaryRangeFirestoreData(salaryRange, forFieldValue);
  final nestedData =
      salaryRangeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = salaryRange.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSalaryRangeFirestoreData(
  SalaryRangeStruct? salaryRange, [
  bool forFieldValue = false,
]) {
  if (salaryRange == null) {
    return {};
  }
  final firestoreData = mapToFirestore(salaryRange.toMap());

  // Add any Firestore field values
  salaryRange.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSalaryRangeListFirestoreData(
  List<SalaryRangeStruct>? salaryRanges,
) =>
    salaryRanges?.map((e) => getSalaryRangeFirestoreData(e, true)).toList() ??
    [];
