import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GeneralSettingsConfigRecord extends FirestoreRecord {
  GeneralSettingsConfigRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "degreeList" field.
  List<String>? _degreeList;
  List<String> get degreeList => _degreeList ?? const [];
  bool hasDegreeList() => _degreeList != null;

  // "subjects" field.
  List<String>? _subjects;
  List<String> get subjects => _subjects ?? const [];
  bool hasSubjects() => _subjects != null;

  void _initializeFields() {
    _degreeList = getDataList(snapshotData['degreeList']);
    _subjects = getDataList(snapshotData['subjects']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('generalSettingsConfig');

  static Stream<GeneralSettingsConfigRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => GeneralSettingsConfigRecord.fromSnapshot(s));

  static Future<GeneralSettingsConfigRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GeneralSettingsConfigRecord.fromSnapshot(s));

  static GeneralSettingsConfigRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GeneralSettingsConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GeneralSettingsConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GeneralSettingsConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GeneralSettingsConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GeneralSettingsConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGeneralSettingsConfigRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class GeneralSettingsConfigRecordDocumentEquality
    implements Equality<GeneralSettingsConfigRecord> {
  const GeneralSettingsConfigRecordDocumentEquality();

  @override
  bool equals(
      GeneralSettingsConfigRecord? e1, GeneralSettingsConfigRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.degreeList, e2?.degreeList) &&
        listEquality.equals(e1?.subjects, e2?.subjects);
  }

  @override
  int hash(GeneralSettingsConfigRecord? e) =>
      const ListEquality().hash([e?.degreeList, e?.subjects]);

  @override
  bool isValidKey(Object? o) => o is GeneralSettingsConfigRecord;
}
