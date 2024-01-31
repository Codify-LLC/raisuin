// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdsStruct extends FFFirebaseStruct {
  AdsStruct({
    int? adsLeft,
    int? liveAds,
    int? totalVacancies,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _adsLeft = adsLeft,
        _liveAds = liveAds,
        _totalVacancies = totalVacancies,
        super(firestoreUtilData);

  // "ads_left" field.
  int? _adsLeft;
  int get adsLeft => _adsLeft ?? 0;
  set adsLeft(int? val) => _adsLeft = val;
  void incrementAdsLeft(int amount) => _adsLeft = adsLeft + amount;
  bool hasAdsLeft() => _adsLeft != null;

  // "live_ads" field.
  int? _liveAds;
  int get liveAds => _liveAds ?? 0;
  set liveAds(int? val) => _liveAds = val;
  void incrementLiveAds(int amount) => _liveAds = liveAds + amount;
  bool hasLiveAds() => _liveAds != null;

  // "total_vacancies" field.
  int? _totalVacancies;
  int get totalVacancies => _totalVacancies ?? 0;
  set totalVacancies(int? val) => _totalVacancies = val;
  void incrementTotalVacancies(int amount) =>
      _totalVacancies = totalVacancies + amount;
  bool hasTotalVacancies() => _totalVacancies != null;

  static AdsStruct fromMap(Map<String, dynamic> data) => AdsStruct(
        adsLeft: castToType<int>(data['ads_left']),
        liveAds: castToType<int>(data['live_ads']),
        totalVacancies: castToType<int>(data['total_vacancies']),
      );

  static AdsStruct? maybeFromMap(dynamic data) =>
      data is Map ? AdsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ads_left': _adsLeft,
        'live_ads': _liveAds,
        'total_vacancies': _totalVacancies,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ads_left': serializeParam(
          _adsLeft,
          ParamType.int,
        ),
        'live_ads': serializeParam(
          _liveAds,
          ParamType.int,
        ),
        'total_vacancies': serializeParam(
          _totalVacancies,
          ParamType.int,
        ),
      }.withoutNulls;

  static AdsStruct fromSerializableMap(Map<String, dynamic> data) => AdsStruct(
        adsLeft: deserializeParam(
          data['ads_left'],
          ParamType.int,
          false,
        ),
        liveAds: deserializeParam(
          data['live_ads'],
          ParamType.int,
          false,
        ),
        totalVacancies: deserializeParam(
          data['total_vacancies'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AdsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdsStruct &&
        adsLeft == other.adsLeft &&
        liveAds == other.liveAds &&
        totalVacancies == other.totalVacancies;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([adsLeft, liveAds, totalVacancies]);
}

AdsStruct createAdsStruct({
  int? adsLeft,
  int? liveAds,
  int? totalVacancies,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdsStruct(
      adsLeft: adsLeft,
      liveAds: liveAds,
      totalVacancies: totalVacancies,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdsStruct? updateAdsStruct(
  AdsStruct? ads, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ads
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdsStructData(
  Map<String, dynamic> firestoreData,
  AdsStruct? ads,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ads == null) {
    return;
  }
  if (ads.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && ads.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final adsData = getAdsFirestoreData(ads, forFieldValue);
  final nestedData = adsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ads.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdsFirestoreData(
  AdsStruct? ads, [
  bool forFieldValue = false,
]) {
  if (ads == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ads.toMap());

  // Add any Firestore field values
  ads.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdsListFirestoreData(
  List<AdsStruct>? adss,
) =>
    adss?.map((e) => getAdsFirestoreData(e, true)).toList() ?? [];
