// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FromToDateTimeStruct extends FFFirebaseStruct {
  FromToDateTimeStruct({
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

  static FromToDateTimeStruct fromMap(Map<String, dynamic> data) =>
      FromToDateTimeStruct(
        from: data['from'] as DateTime?,
        to: data['to'] as DateTime?,
      );

  static FromToDateTimeStruct? maybeFromMap(dynamic data) => data is Map
      ? FromToDateTimeStruct.fromMap(data.cast<String, dynamic>())
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

  static FromToDateTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      FromToDateTimeStruct(
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
  String toString() => 'FromToDateTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FromToDateTimeStruct &&
        from == other.from &&
        to == other.to;
  }

  @override
  int get hashCode => const ListEquality().hash([from, to]);
}

FromToDateTimeStruct createFromToDateTimeStruct({
  DateTime? from,
  DateTime? to,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FromToDateTimeStruct(
      from: from,
      to: to,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FromToDateTimeStruct? updateFromToDateTimeStruct(
  FromToDateTimeStruct? fromToDateTime, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fromToDateTime
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFromToDateTimeStructData(
  Map<String, dynamic> firestoreData,
  FromToDateTimeStruct? fromToDateTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fromToDateTime == null) {
    return;
  }
  if (fromToDateTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fromToDateTime.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fromToDateTimeData =
      getFromToDateTimeFirestoreData(fromToDateTime, forFieldValue);
  final nestedData =
      fromToDateTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fromToDateTime.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFromToDateTimeFirestoreData(
  FromToDateTimeStruct? fromToDateTime, [
  bool forFieldValue = false,
]) {
  if (fromToDateTime == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fromToDateTime.toMap());

  // Add any Firestore field values
  fromToDateTime.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFromToDateTimeListFirestoreData(
  List<FromToDateTimeStruct>? fromToDateTimes,
) =>
    fromToDateTimes
        ?.map((e) => getFromToDateTimeFirestoreData(e, true))
        .toList() ??
    [];
