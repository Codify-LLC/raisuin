// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FileDataStruct extends FFFirebaseStruct {
  FileDataStruct({
    String? name,
    String? fileType,
    String? downloadUrl,
    String? fileSize,
    String? uploadedOn,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _fileType = fileType,
        _downloadUrl = downloadUrl,
        _fileSize = fileSize,
        _uploadedOn = uploadedOn,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "file_type" field.
  String? _fileType;
  String get fileType => _fileType ?? '';
  set fileType(String? val) => _fileType = val;
  bool hasFileType() => _fileType != null;

  // "download_url" field.
  String? _downloadUrl;
  String get downloadUrl => _downloadUrl ?? '';
  set downloadUrl(String? val) => _downloadUrl = val;
  bool hasDownloadUrl() => _downloadUrl != null;

  // "file_size" field.
  String? _fileSize;
  String get fileSize => _fileSize ?? '';
  set fileSize(String? val) => _fileSize = val;
  bool hasFileSize() => _fileSize != null;

  // "uploaded_on" field.
  String? _uploadedOn;
  String get uploadedOn => _uploadedOn ?? '';
  set uploadedOn(String? val) => _uploadedOn = val;
  bool hasUploadedOn() => _uploadedOn != null;

  static FileDataStruct fromMap(Map<String, dynamic> data) => FileDataStruct(
        name: data['name'] as String?,
        fileType: data['file_type'] as String?,
        downloadUrl: data['download_url'] as String?,
        fileSize: data['file_size'] as String?,
        uploadedOn: data['uploaded_on'] as String?,
      );

  static FileDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? FileDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'file_type': _fileType,
        'download_url': _downloadUrl,
        'file_size': _fileSize,
        'uploaded_on': _uploadedOn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'file_type': serializeParam(
          _fileType,
          ParamType.String,
        ),
        'download_url': serializeParam(
          _downloadUrl,
          ParamType.String,
        ),
        'file_size': serializeParam(
          _fileSize,
          ParamType.String,
        ),
        'uploaded_on': serializeParam(
          _uploadedOn,
          ParamType.String,
        ),
      }.withoutNulls;

  static FileDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      FileDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        fileType: deserializeParam(
          data['file_type'],
          ParamType.String,
          false,
        ),
        downloadUrl: deserializeParam(
          data['download_url'],
          ParamType.String,
          false,
        ),
        fileSize: deserializeParam(
          data['file_size'],
          ParamType.String,
          false,
        ),
        uploadedOn: deserializeParam(
          data['uploaded_on'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FileDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FileDataStruct &&
        name == other.name &&
        fileType == other.fileType &&
        downloadUrl == other.downloadUrl &&
        fileSize == other.fileSize &&
        uploadedOn == other.uploadedOn;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, fileType, downloadUrl, fileSize, uploadedOn]);
}

FileDataStruct createFileDataStruct({
  String? name,
  String? fileType,
  String? downloadUrl,
  String? fileSize,
  String? uploadedOn,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FileDataStruct(
      name: name,
      fileType: fileType,
      downloadUrl: downloadUrl,
      fileSize: fileSize,
      uploadedOn: uploadedOn,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FileDataStruct? updateFileDataStruct(
  FileDataStruct? fileData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fileData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFileDataStructData(
  Map<String, dynamic> firestoreData,
  FileDataStruct? fileData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fileData == null) {
    return;
  }
  if (fileData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fileData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fileDataData = getFileDataFirestoreData(fileData, forFieldValue);
  final nestedData = fileDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fileData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFileDataFirestoreData(
  FileDataStruct? fileData, [
  bool forFieldValue = false,
]) {
  if (fileData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fileData.toMap());

  // Add any Firestore field values
  fileData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFileDataListFirestoreData(
  List<FileDataStruct>? fileDatas,
) =>
    fileDatas?.map((e) => getFileDataFirestoreData(e, true)).toList() ?? [];
