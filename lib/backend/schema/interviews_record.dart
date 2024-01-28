import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class InterviewsRecord extends FirestoreRecord {
  InterviewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "recruiter" field.
  DocumentReference? _recruiter;
  DocumentReference? get recruiter => _recruiter;
  bool hasRecruiter() => _recruiter != null;

  // "candidate" field.
  DocumentReference? _candidate;
  DocumentReference? get candidate => _candidate;
  bool hasCandidate() => _candidate != null;

  // "chat_ref" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  // "interview_date" field.
  DateTime? _interviewDate;
  DateTime? get interviewDate => _interviewDate;
  bool hasInterviewDate() => _interviewDate != null;

  // "interview_mode" field.
  String? _interviewMode;
  String get interviewMode => _interviewMode ?? '';
  bool hasInterviewMode() => _interviewMode != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _recruiter = snapshotData['recruiter'] as DocumentReference?;
    _candidate = snapshotData['candidate'] as DocumentReference?;
    _chatRef = snapshotData['chat_ref'] as DocumentReference?;
    _interviewDate = snapshotData['interview_date'] as DateTime?;
    _interviewMode = snapshotData['interview_mode'] as String?;
    _message = snapshotData['message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('interviews');

  static Stream<InterviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InterviewsRecord.fromSnapshot(s));

  static Future<InterviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InterviewsRecord.fromSnapshot(s));

  static InterviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InterviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InterviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InterviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InterviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InterviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInterviewsRecordData({
  DocumentReference? recruiter,
  DocumentReference? candidate,
  DocumentReference? chatRef,
  DateTime? interviewDate,
  String? interviewMode,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recruiter': recruiter,
      'candidate': candidate,
      'chat_ref': chatRef,
      'interview_date': interviewDate,
      'interview_mode': interviewMode,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class InterviewsRecordDocumentEquality implements Equality<InterviewsRecord> {
  const InterviewsRecordDocumentEquality();

  @override
  bool equals(InterviewsRecord? e1, InterviewsRecord? e2) {
    return e1?.recruiter == e2?.recruiter &&
        e1?.candidate == e2?.candidate &&
        e1?.chatRef == e2?.chatRef &&
        e1?.interviewDate == e2?.interviewDate &&
        e1?.interviewMode == e2?.interviewMode &&
        e1?.message == e2?.message;
  }

  @override
  int hash(InterviewsRecord? e) => const ListEquality().hash([
        e?.recruiter,
        e?.candidate,
        e?.chatRef,
        e?.interviewDate,
        e?.interviewMode,
        e?.message
      ]);

  @override
  bool isValidKey(Object? o) => o is InterviewsRecord;
}
