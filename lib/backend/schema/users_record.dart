import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  // "subscriptionActiveTill" field.
  DateTime? _subscriptionActiveTill;
  DateTime? get subscriptionActiveTill => _subscriptionActiveTill;
  bool hasSubscriptionActiveTill() => _subscriptionActiveTill != null;

  // "subscribed" field.
  bool? _subscribed;
  bool get subscribed => _subscribed ?? false;
  bool hasSubscribed() => _subscribed != null;

  // "seeking_job_type" field.
  String? _seekingJobType;
  String get seekingJobType => _seekingJobType ?? '';
  bool hasSeekingJobType() => _seekingJobType != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "salary_range" field.
  SalaryRangeStruct? _salaryRange;
  SalaryRangeStruct get salaryRange => _salaryRange ?? SalaryRangeStruct();
  bool hasSalaryRange() => _salaryRange != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "savedCandidates" field.
  List<DocumentReference>? _savedCandidates;
  List<DocumentReference> get savedCandidates => _savedCandidates ?? const [];
  bool hasSavedCandidates() => _savedCandidates != null;

  // "introVideos" field.
  List<VideosStruct>? _introVideos;
  List<VideosStruct> get introVideos => _introVideos ?? const [];
  bool hasIntroVideos() => _introVideos != null;

  // "resume" field.
  String? _resume;
  String get resume => _resume ?? '';
  bool hasResume() => _resume != null;

  // "exprienced_in" field.
  String? _expriencedIn;
  String get expriencedIn => _expriencedIn ?? '';
  bool hasExpriencedIn() => _expriencedIn != null;

  // "preferred_posting" field.
  String? _preferredPosting;
  String get preferredPosting => _preferredPosting ?? '';
  bool hasPreferredPosting() => _preferredPosting != null;

  // "marital_status" field.
  String? _maritalStatus;
  String get maritalStatus => _maritalStatus ?? '';
  bool hasMaritalStatus() => _maritalStatus != null;

  // "mother_tongue" field.
  String? _motherTongue;
  String get motherTongue => _motherTongue ?? '';
  bool hasMotherTongue() => _motherTongue != null;

  // "language_known" field.
  List<String>? _languageKnown;
  List<String> get languageKnown => _languageKnown ?? const [];
  bool hasLanguageKnown() => _languageKnown != null;

  // "education" field.
  List<EducationStruct>? _education;
  List<EducationStruct> get education => _education ?? const [];
  bool hasEducation() => _education != null;

  // "work_experience_history" field.
  List<WorkExperienceStruct>? _workExperienceHistory;
  List<WorkExperienceStruct> get workExperienceHistory =>
      _workExperienceHistory ?? const [];
  bool hasWorkExperienceHistory() => _workExperienceHistory != null;

  // "whatsapp" field.
  bool? _whatsapp;
  bool get whatsapp => _whatsapp ?? false;
  bool hasWhatsapp() => _whatsapp != null;

  // "viewed_profile" field.
  List<DocumentReference>? _viewedProfile;
  List<DocumentReference> get viewedProfile => _viewedProfile ?? const [];
  bool hasViewedProfile() => _viewedProfile != null;

  // "video_bio" field.
  String? _videoBio;
  String get videoBio => _videoBio ?? '';
  bool hasVideoBio() => _videoBio != null;

  // "job_seek_district" field.
  List<AddressStruct>? _jobSeekDistrict;
  List<AddressStruct> get jobSeekDistrict => _jobSeekDistrict ?? const [];
  bool hasJobSeekDistrict() => _jobSeekDistrict != null;

  // "seeking_job_post" field.
  String? _seekingJobPost;
  String get seekingJobPost => _seekingJobPost ?? '';
  bool hasSeekingJobPost() => _seekingJobPost != null;

  // "ads" field.
  AdsStruct? _ads;
  AdsStruct get ads => _ads ?? AdsStruct();
  bool hasAds() => _ads != null;

  // "profile_type" field.
  ProfileType? _profileType;
  ProfileType? get profileType => _profileType;
  bool hasProfileType() => _profileType != null;

  // "school_name" field.
  String? _schoolName;
  String get schoolName => _schoolName ?? '';
  bool hasSchoolName() => _schoolName != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userRole = snapshotData['user_role'] as String?;
    _address = AddressStruct.maybeFromMap(snapshotData['address']);
    _subscriptionActiveTill =
        snapshotData['subscriptionActiveTill'] as DateTime?;
    _subscribed = snapshotData['subscribed'] as bool?;
    _seekingJobType = snapshotData['seeking_job_type'] as String?;
    _gender = snapshotData['gender'] as String?;
    _salaryRange = SalaryRangeStruct.maybeFromMap(snapshotData['salary_range']);
    _dob = snapshotData['dob'] as DateTime?;
    _savedCandidates = getDataList(snapshotData['savedCandidates']);
    _introVideos = getStructList(
      snapshotData['introVideos'],
      VideosStruct.fromMap,
    );
    _resume = snapshotData['resume'] as String?;
    _expriencedIn = snapshotData['exprienced_in'] as String?;
    _preferredPosting = snapshotData['preferred_posting'] as String?;
    _maritalStatus = snapshotData['marital_status'] as String?;
    _motherTongue = snapshotData['mother_tongue'] as String?;
    _languageKnown = getDataList(snapshotData['language_known']);
    _education = getStructList(
      snapshotData['education'],
      EducationStruct.fromMap,
    );
    _workExperienceHistory = getStructList(
      snapshotData['work_experience_history'],
      WorkExperienceStruct.fromMap,
    );
    _whatsapp = snapshotData['whatsapp'] as bool?;
    _viewedProfile = getDataList(snapshotData['viewed_profile']);
    _videoBio = snapshotData['video_bio'] as String?;
    _jobSeekDistrict = getStructList(
      snapshotData['job_seek_district'],
      AddressStruct.fromMap,
    );
    _seekingJobPost = snapshotData['seeking_job_post'] as String?;
    _ads = AdsStruct.maybeFromMap(snapshotData['ads']);
    _profileType = deserializeEnum<ProfileType>(snapshotData['profile_type']);
    _schoolName = snapshotData['school_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userRole,
  AddressStruct? address,
  DateTime? subscriptionActiveTill,
  bool? subscribed,
  String? seekingJobType,
  String? gender,
  SalaryRangeStruct? salaryRange,
  DateTime? dob,
  String? resume,
  String? expriencedIn,
  String? preferredPosting,
  String? maritalStatus,
  String? motherTongue,
  bool? whatsapp,
  String? videoBio,
  String? seekingJobPost,
  AdsStruct? ads,
  ProfileType? profileType,
  String? schoolName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'user_role': userRole,
      'address': AddressStruct().toMap(),
      'subscriptionActiveTill': subscriptionActiveTill,
      'subscribed': subscribed,
      'seeking_job_type': seekingJobType,
      'gender': gender,
      'salary_range': SalaryRangeStruct().toMap(),
      'dob': dob,
      'resume': resume,
      'exprienced_in': expriencedIn,
      'preferred_posting': preferredPosting,
      'marital_status': maritalStatus,
      'mother_tongue': motherTongue,
      'whatsapp': whatsapp,
      'video_bio': videoBio,
      'seeking_job_post': seekingJobPost,
      'ads': AdsStruct().toMap(),
      'profile_type': profileType,
      'school_name': schoolName,
    }.withoutNulls,
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  // Handle nested data for "salary_range" field.
  addSalaryRangeStructData(firestoreData, salaryRange, 'salary_range');

  // Handle nested data for "ads" field.
  addAdsStructData(firestoreData, ads, 'ads');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userRole == e2?.userRole &&
        e1?.address == e2?.address &&
        e1?.subscriptionActiveTill == e2?.subscriptionActiveTill &&
        e1?.subscribed == e2?.subscribed &&
        e1?.seekingJobType == e2?.seekingJobType &&
        e1?.gender == e2?.gender &&
        e1?.salaryRange == e2?.salaryRange &&
        e1?.dob == e2?.dob &&
        listEquality.equals(e1?.savedCandidates, e2?.savedCandidates) &&
        listEquality.equals(e1?.introVideos, e2?.introVideos) &&
        e1?.resume == e2?.resume &&
        e1?.expriencedIn == e2?.expriencedIn &&
        e1?.preferredPosting == e2?.preferredPosting &&
        e1?.maritalStatus == e2?.maritalStatus &&
        e1?.motherTongue == e2?.motherTongue &&
        listEquality.equals(e1?.languageKnown, e2?.languageKnown) &&
        listEquality.equals(e1?.education, e2?.education) &&
        listEquality.equals(
            e1?.workExperienceHistory, e2?.workExperienceHistory) &&
        e1?.whatsapp == e2?.whatsapp &&
        listEquality.equals(e1?.viewedProfile, e2?.viewedProfile) &&
        e1?.videoBio == e2?.videoBio &&
        listEquality.equals(e1?.jobSeekDistrict, e2?.jobSeekDistrict) &&
        e1?.seekingJobPost == e2?.seekingJobPost &&
        e1?.ads == e2?.ads &&
        e1?.profileType == e2?.profileType &&
        e1?.schoolName == e2?.schoolName;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userRole,
        e?.address,
        e?.subscriptionActiveTill,
        e?.subscribed,
        e?.seekingJobType,
        e?.gender,
        e?.salaryRange,
        e?.dob,
        e?.savedCandidates,
        e?.introVideos,
        e?.resume,
        e?.expriencedIn,
        e?.preferredPosting,
        e?.maritalStatus,
        e?.motherTongue,
        e?.languageKnown,
        e?.education,
        e?.workExperienceHistory,
        e?.whatsapp,
        e?.viewedProfile,
        e?.videoBio,
        e?.jobSeekDistrict,
        e?.seekingJobPost,
        e?.ads,
        e?.profileType,
        e?.schoolName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
