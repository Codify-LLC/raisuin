import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "user_1_name" field.
  String? _user1Name;
  String get user1Name => _user1Name ?? '';
  bool hasUser1Name() => _user1Name != null;

  // "user_1_gmail" field.
  String? _user1Gmail;
  String get user1Gmail => _user1Gmail ?? '';
  bool hasUser1Gmail() => _user1Gmail != null;

  // "user_2_name" field.
  String? _user2Name;
  String get user2Name => _user2Name ?? '';
  bool hasUser2Name() => _user2Name != null;

  // "user_2_gmail" field.
  String? _user2Gmail;
  String get user2Gmail => _user2Gmail ?? '';
  bool hasUser2Gmail() => _user2Gmail != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['users']);
    _user1Name = snapshotData['user_1_name'] as String?;
    _user1Gmail = snapshotData['user_1_gmail'] as String?;
    _user2Name = snapshotData['user_2_name'] as String?;
    _user2Gmail = snapshotData['user_2_gmail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? user1Name,
  String? user1Gmail,
  String? user2Name,
  String? user2Gmail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_1_name': user1Name,
      'user_1_gmail': user1Gmail,
      'user_2_name': user2Name,
      'user_2_gmail': user2Gmail,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) &&
        e1?.user1Name == e2?.user1Name &&
        e1?.user1Gmail == e2?.user1Gmail &&
        e1?.user2Name == e2?.user2Name &&
        e1?.user2Gmail == e2?.user2Gmail;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash(
      [e?.users, e?.user1Name, e?.user1Gmail, e?.user2Name, e?.user2Gmail]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
