import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCallEduStaff';

class ReverseGeocodingCall {
  static Future<ApiCallResponse> call({
    String? latlng = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ReverseGeocodingCall',
        'variables': {
          'latlng': latlng,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?@.types[0]=="administrative_area_level_1"].long_name''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[?@.types[0]=="locality"].long_name''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
