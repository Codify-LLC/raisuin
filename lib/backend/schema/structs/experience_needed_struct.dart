// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExperienceNeededStruct extends FFFirebaseStruct {
  ExperienceNeededStruct({
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

  static ExperienceNeededStruct fromMap(Map<String, dynamic> data) =>
      ExperienceNeededStruct(
        from: castToType<int>(data['from']),
        to: castToType<int>(data['to']),
      );

  static ExperienceNeededStruct? maybeFromMap(dynamic data) => data is Map
      ? ExperienceNeededStruct.fromMap(data.cast<String, dynamic>())
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

  static ExperienceNeededStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ExperienceNeededStruct(
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
  String toString() => 'ExperienceNeededStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExperienceNeededStruct &&
        from == other.from &&
        to == other.to;
  }

  @override
  int get hashCode => const ListEquality().hash([from, to]);
}

ExperienceNeededStruct createExperienceNeededStruct({
  int? from,
  int? to,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExperienceNeededStruct(
      from: from,
      to: to,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExperienceNeededStruct? updateExperienceNeededStruct(
  ExperienceNeededStruct? experienceNeeded, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    experienceNeeded
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExperienceNeededStructData(
  Map<String, dynamic> firestoreData,
  ExperienceNeededStruct? experienceNeeded,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (experienceNeeded == null) {
    return;
  }
  if (experienceNeeded.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && experienceNeeded.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final experienceNeededData =
      getExperienceNeededFirestoreData(experienceNeeded, forFieldValue);
  final nestedData =
      experienceNeededData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = experienceNeeded.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExperienceNeededFirestoreData(
  ExperienceNeededStruct? experienceNeeded, [
  bool forFieldValue = false,
]) {
  if (experienceNeeded == null) {
    return {};
  }
  final firestoreData = mapToFirestore(experienceNeeded.toMap());

  // Add any Firestore field values
  experienceNeeded.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExperienceNeededListFirestoreData(
  List<ExperienceNeededStruct>? experienceNeededs,
) =>
    experienceNeededs
        ?.map((e) => getExperienceNeededFirestoreData(e, true))
        .toList() ??
    [];
