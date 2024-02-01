// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatUserStruct extends FFFirebaseStruct {
  ChatUserStruct({
    DocumentReference? userRef,
    String? userName,
    String? userEmail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRef = userRef,
        _userName = userName,
        _userEmail = userEmail,
        super(firestoreUtilData);

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;
  bool hasUserRef() => _userRef != null;

  // "UserName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "UserEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;
  bool hasUserEmail() => _userEmail != null;

  static ChatUserStruct fromMap(Map<String, dynamic> data) => ChatUserStruct(
        userRef: data['UserRef'] as DocumentReference?,
        userName: data['UserName'] as String?,
        userEmail: data['UserEmail'] as String?,
      );

  static ChatUserStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatUserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'UserRef': _userRef,
        'UserName': _userName,
        'UserEmail': _userEmail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UserRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'UserName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'UserEmail': serializeParam(
          _userEmail,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatUserStruct(
        userRef: deserializeParam(
          data['UserRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        userName: deserializeParam(
          data['UserName'],
          ParamType.String,
          false,
        ),
        userEmail: deserializeParam(
          data['UserEmail'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatUserStruct &&
        userRef == other.userRef &&
        userName == other.userName &&
        userEmail == other.userEmail;
  }

  @override
  int get hashCode => const ListEquality().hash([userRef, userName, userEmail]);
}

ChatUserStruct createChatUserStruct({
  DocumentReference? userRef,
  String? userName,
  String? userEmail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatUserStruct(
      userRef: userRef,
      userName: userName,
      userEmail: userEmail,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatUserStruct? updateChatUserStruct(
  ChatUserStruct? chatUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatUserStructData(
  Map<String, dynamic> firestoreData,
  ChatUserStruct? chatUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatUser == null) {
    return;
  }
  if (chatUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatUserData = getChatUserFirestoreData(chatUser, forFieldValue);
  final nestedData = chatUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatUserFirestoreData(
  ChatUserStruct? chatUser, [
  bool forFieldValue = false,
]) {
  if (chatUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatUser.toMap());

  // Add any Firestore field values
  chatUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatUserListFirestoreData(
  List<ChatUserStruct>? chatUsers,
) =>
    chatUsers?.map((e) => getChatUserFirestoreData(e, true)).toList() ?? [];
