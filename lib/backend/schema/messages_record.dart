import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sent_by" field.
  DocumentReference? _sentBy;
  DocumentReference? get sentBy => _sentBy;
  bool hasSentBy() => _sentBy != null;

  // "chat" field.
  DocumentReference? _chat;
  DocumentReference? get chat => _chat;
  bool hasChat() => _chat != null;

  // "text_message" field.
  String? _textMessage;
  String get textMessage => _textMessage ?? '';
  bool hasTextMessage() => _textMessage != null;

  // "sent_on" field.
  DateTime? _sentOn;
  DateTime? get sentOn => _sentOn;
  bool hasSentOn() => _sentOn != null;

  // "interview" field.
  DocumentReference? _interview;
  DocumentReference? get interview => _interview;
  bool hasInterview() => _interview != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  void _initializeFields() {
    _sentBy = snapshotData['sent_by'] as DocumentReference?;
    _chat = snapshotData['chat'] as DocumentReference?;
    _textMessage = snapshotData['text_message'] as String?;
    _sentOn = snapshotData['sent_on'] as DateTime?;
    _interview = snapshotData['interview'] as DocumentReference?;
    _photo = snapshotData['photo'] as String?;
    _video = snapshotData['video'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DocumentReference? sentBy,
  DocumentReference? chat,
  String? textMessage,
  DateTime? sentOn,
  DocumentReference? interview,
  String? photo,
  String? video,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sent_by': sentBy,
      'chat': chat,
      'text_message': textMessage,
      'sent_on': sentOn,
      'interview': interview,
      'photo': photo,
      'video': video,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.sentBy == e2?.sentBy &&
        e1?.chat == e2?.chat &&
        e1?.textMessage == e2?.textMessage &&
        e1?.sentOn == e2?.sentOn &&
        e1?.interview == e2?.interview &&
        e1?.photo == e2?.photo &&
        e1?.video == e2?.video;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.sentBy,
        e?.chat,
        e?.textMessage,
        e?.sentOn,
        e?.interview,
        e?.photo,
        e?.video
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
