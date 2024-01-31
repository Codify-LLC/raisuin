import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdsRecord extends FirestoreRecord {
  AdsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "position_type" field.
  String? _positionType;
  String get positionType => _positionType ?? '';
  bool hasPositionType() => _positionType != null;

  // "position_title" field.
  String? _positionTitle;
  String get positionTitle => _positionTitle ?? '';
  bool hasPositionTitle() => _positionTitle != null;

  // "school_institute" field.
  String? _schoolInstitute;
  String get schoolInstitute => _schoolInstitute ?? '';
  bool hasSchoolInstitute() => _schoolInstitute != null;

  // "requirement_for" field.
  String? _requirementFor;
  String get requirementFor => _requirementFor ?? '';
  bool hasRequirementFor() => _requirementFor != null;

  // "job_type" field.
  String? _jobType;
  String get jobType => _jobType ?? '';
  bool hasJobType() => _jobType != null;

  // "preferred_gender" field.
  String? _preferredGender;
  String get preferredGender => _preferredGender ?? '';
  bool hasPreferredGender() => _preferredGender != null;

  // "education_required" field.
  EducationStruct? _educationRequired;
  EducationStruct get educationRequired =>
      _educationRequired ?? EducationStruct();
  bool hasEducationRequired() => _educationRequired != null;

  // "english_level" field.
  String? _englishLevel;
  String get englishLevel => _englishLevel ?? '';
  bool hasEnglishLevel() => _englishLevel != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "applied_for_jobs" field.
  List<DocumentReference>? _appliedForJobs;
  List<DocumentReference> get appliedForJobs => _appliedForJobs ?? const [];
  bool hasAppliedForJobs() => _appliedForJobs != null;

  // "job_location" field.
  AddressStruct? _jobLocation;
  AddressStruct get jobLocation => _jobLocation ?? AddressStruct();
  bool hasJobLocation() => _jobLocation != null;

  // "shift" field.
  String? _shift;
  String get shift => _shift ?? '';
  bool hasShift() => _shift != null;

  // "monthly_salary" field.
  SalaryRangeStruct? _monthlySalary;
  SalaryRangeStruct get monthlySalary => _monthlySalary ?? SalaryRangeStruct();
  bool hasMonthlySalary() => _monthlySalary != null;

  // "additional_perks" field.
  List<String>? _additionalPerks;
  List<String> get additionalPerks => _additionalPerks ?? const [];
  bool hasAdditionalPerks() => _additionalPerks != null;

  // "looking_job_for_selected_states" field.
  AddressStruct? _lookingJobForSelectedStates;
  AddressStruct get lookingJobForSelectedStates =>
      _lookingJobForSelectedStates ?? AddressStruct();
  bool hasLookingJobForSelectedStates() => _lookingJobForSelectedStates != null;

  // "experience" field.
  ExperienceNeededStruct? _experience;
  ExperienceNeededStruct get experience =>
      _experience ?? ExperienceNeededStruct();
  bool hasExperience() => _experience != null;

  // "experienceType" field.
  String? _experienceType;
  String get experienceType => _experienceType ?? '';
  bool hasExperienceType() => _experienceType != null;

  // "regional_language" field.
  List<String>? _regionalLanguage;
  List<String> get regionalLanguage => _regionalLanguage ?? const [];
  bool hasRegionalLanguage() => _regionalLanguage != null;

  // "candidates_applied" field.
  List<DocumentReference>? _candidatesApplied;
  List<DocumentReference> get candidatesApplied =>
      _candidatesApplied ?? const [];
  bool hasCandidatesApplied() => _candidatesApplied != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "overview_images" field.
  List<String>? _overviewImages;
  List<String> get overviewImages => _overviewImages ?? const [];
  bool hasOverviewImages() => _overviewImages != null;

  // "interview_mode" field.
  String? _interviewMode;
  String get interviewMode => _interviewMode ?? '';
  bool hasInterviewMode() => _interviewMode != null;

  // "interview_date" field.
  FromToDateTimeStruct? _interviewDate;
  FromToDateTimeStruct get interviewDate =>
      _interviewDate ?? FromToDateTimeStruct();
  bool hasInterviewDate() => _interviewDate != null;

  // "total_vacancy" field.
  int? _totalVacancy;
  int get totalVacancy => _totalVacancy ?? 0;
  bool hasTotalVacancy() => _totalVacancy != null;

  void _initializeFields() {
    _positionType = snapshotData['position_type'] as String?;
    _positionTitle = snapshotData['position_title'] as String?;
    _schoolInstitute = snapshotData['school_institute'] as String?;
    _requirementFor = snapshotData['requirement_for'] as String?;
    _jobType = snapshotData['job_type'] as String?;
    _preferredGender = snapshotData['preferred_gender'] as String?;
    _educationRequired =
        EducationStruct.maybeFromMap(snapshotData['education_required']);
    _englishLevel = snapshotData['english_level'] as String?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _appliedForJobs = getDataList(snapshotData['applied_for_jobs']);
    _jobLocation = AddressStruct.maybeFromMap(snapshotData['job_location']);
    _shift = snapshotData['shift'] as String?;
    _monthlySalary =
        SalaryRangeStruct.maybeFromMap(snapshotData['monthly_salary']);
    _additionalPerks = getDataList(snapshotData['additional_perks']);
    _lookingJobForSelectedStates = AddressStruct.maybeFromMap(
        snapshotData['looking_job_for_selected_states']);
    _experience =
        ExperienceNeededStruct.maybeFromMap(snapshotData['experience']);
    _experienceType = snapshotData['experienceType'] as String?;
    _regionalLanguage = getDataList(snapshotData['regional_language']);
    _candidatesApplied = getDataList(snapshotData['candidates_applied']);
    _logo = snapshotData['logo'] as String?;
    _overviewImages = getDataList(snapshotData['overview_images']);
    _interviewMode = snapshotData['interview_mode'] as String?;
    _interviewDate =
        FromToDateTimeStruct.maybeFromMap(snapshotData['interview_date']);
    _totalVacancy = castToType<int>(snapshotData['total_vacancy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ads');

  static Stream<AdsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdsRecord.fromSnapshot(s));

  static Future<AdsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdsRecord.fromSnapshot(s));

  static AdsRecord fromSnapshot(DocumentSnapshot snapshot) => AdsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdsRecordData({
  String? positionType,
  String? positionTitle,
  String? schoolInstitute,
  String? requirementFor,
  String? jobType,
  String? preferredGender,
  EducationStruct? educationRequired,
  String? englishLevel,
  DocumentReference? createdBy,
  AddressStruct? jobLocation,
  String? shift,
  SalaryRangeStruct? monthlySalary,
  AddressStruct? lookingJobForSelectedStates,
  ExperienceNeededStruct? experience,
  String? experienceType,
  String? logo,
  String? interviewMode,
  FromToDateTimeStruct? interviewDate,
  int? totalVacancy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'position_type': positionType,
      'position_title': positionTitle,
      'school_institute': schoolInstitute,
      'requirement_for': requirementFor,
      'job_type': jobType,
      'preferred_gender': preferredGender,
      'education_required': EducationStruct().toMap(),
      'english_level': englishLevel,
      'created_by': createdBy,
      'job_location': AddressStruct().toMap(),
      'shift': shift,
      'monthly_salary': SalaryRangeStruct().toMap(),
      'looking_job_for_selected_states': AddressStruct().toMap(),
      'experience': ExperienceNeededStruct().toMap(),
      'experienceType': experienceType,
      'logo': logo,
      'interview_mode': interviewMode,
      'interview_date': FromToDateTimeStruct().toMap(),
      'total_vacancy': totalVacancy,
    }.withoutNulls,
  );

  // Handle nested data for "education_required" field.
  addEducationStructData(
      firestoreData, educationRequired, 'education_required');

  // Handle nested data for "job_location" field.
  addAddressStructData(firestoreData, jobLocation, 'job_location');

  // Handle nested data for "monthly_salary" field.
  addSalaryRangeStructData(firestoreData, monthlySalary, 'monthly_salary');

  // Handle nested data for "looking_job_for_selected_states" field.
  addAddressStructData(firestoreData, lookingJobForSelectedStates,
      'looking_job_for_selected_states');

  // Handle nested data for "experience" field.
  addExperienceNeededStructData(firestoreData, experience, 'experience');

  // Handle nested data for "interview_date" field.
  addFromToDateTimeStructData(firestoreData, interviewDate, 'interview_date');

  return firestoreData;
}

class AdsRecordDocumentEquality implements Equality<AdsRecord> {
  const AdsRecordDocumentEquality();

  @override
  bool equals(AdsRecord? e1, AdsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.positionType == e2?.positionType &&
        e1?.positionTitle == e2?.positionTitle &&
        e1?.schoolInstitute == e2?.schoolInstitute &&
        e1?.requirementFor == e2?.requirementFor &&
        e1?.jobType == e2?.jobType &&
        e1?.preferredGender == e2?.preferredGender &&
        e1?.educationRequired == e2?.educationRequired &&
        e1?.englishLevel == e2?.englishLevel &&
        e1?.createdBy == e2?.createdBy &&
        listEquality.equals(e1?.appliedForJobs, e2?.appliedForJobs) &&
        e1?.jobLocation == e2?.jobLocation &&
        e1?.shift == e2?.shift &&
        e1?.monthlySalary == e2?.monthlySalary &&
        listEquality.equals(e1?.additionalPerks, e2?.additionalPerks) &&
        e1?.lookingJobForSelectedStates == e2?.lookingJobForSelectedStates &&
        e1?.experience == e2?.experience &&
        e1?.experienceType == e2?.experienceType &&
        listEquality.equals(e1?.regionalLanguage, e2?.regionalLanguage) &&
        listEquality.equals(e1?.candidatesApplied, e2?.candidatesApplied) &&
        e1?.logo == e2?.logo &&
        listEquality.equals(e1?.overviewImages, e2?.overviewImages) &&
        e1?.interviewMode == e2?.interviewMode &&
        e1?.interviewDate == e2?.interviewDate &&
        e1?.totalVacancy == e2?.totalVacancy;
  }

  @override
  int hash(AdsRecord? e) => const ListEquality().hash([
        e?.positionType,
        e?.positionTitle,
        e?.schoolInstitute,
        e?.requirementFor,
        e?.jobType,
        e?.preferredGender,
        e?.educationRequired,
        e?.englishLevel,
        e?.createdBy,
        e?.appliedForJobs,
        e?.jobLocation,
        e?.shift,
        e?.monthlySalary,
        e?.additionalPerks,
        e?.lookingJobForSelectedStates,
        e?.experience,
        e?.experienceType,
        e?.regionalLanguage,
        e?.candidatesApplied,
        e?.logo,
        e?.overviewImages,
        e?.interviewMode,
        e?.interviewDate,
        e?.totalVacancy
      ]);

  @override
  bool isValidKey(Object? o) => o is AdsRecord;
}
