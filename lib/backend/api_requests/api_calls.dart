import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Razor Pay Group Code

class RazorPayGroup {
  static String baseUrl = 'https://api.razorpay.com/v1';
  static Map<String, String> headers = {};
  static CreateCustomerCall createCustomerCall = CreateCustomerCall();
  static CreateSubscriptionsCall createSubscriptionsCall =
      CreateSubscriptionsCall();
}

class CreateCustomerCall {
  Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "name":"Gaurav Kumar",
  "email":"gaurav.kumar@example.com",
  "contact":"9123456780",
  "fail_existing":"1",
  "gstin":"12ABCDE2356F7GH",
  "notes":{
    "notes_key_1":"Tea, Earl Grey, Hot",
    "notes_key_2":"Tea, Earl Grey… decaf."
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create customer',
      apiUrl: '${RazorPayGroup.baseUrl}/customers',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSubscriptionsCall {
  Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "plan_id":"{plan_id}",
  "total_count":6,
  "quantity":1,
  "start_at":1735689600,
  "expire_by":1893456000,
  "customer_notify":1,
  "addons":[
    {
      "item":{
        "name":"Delivery charges",
        "amount":30000,
        "currency":"INR"
      }
    }
  ],
  "offer_id":"{offer_id}",
  "notes":{
    "notes_key_1":"Tea, Earl Grey, Hot",
    "notes_key_2":"Tea, Earl Grey… decaf."
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create subscriptions',
      apiUrl: '${RazorPayGroup.baseUrl}/subscriptions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Razor Pay Group Code

class CheckRecruiterSubscriptionCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'check Recruiter Subscription',
      apiUrl: 'https://nodejs-production-466d.up.railway.app/rCheck/${userID}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic pageName(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ServerCheckCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Server Check',
      apiUrl: 'https://nodejs-production-466d.up.railway.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCandidateMatchingCall {
  static Future<ApiCallResponse> call({
    String? recruiterID = '',
    String? gender = '',
    String? eduLevel = '',
    String? state = '',
    int? expFrom,
    int? expTill,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get candidate matching',
      apiUrl:
          'https://nodejs-production-466d.up.railway.app/getcandidatesbyrecruiter',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'gender': gender,
        'recruiterId': recruiterID,
        'eduLevel': eduLevel,
        'state': state,
        'expFrom': expFrom,
        'expTill': expTill,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GeneratepdfCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
"title" : "Test",
"content" : "It works",
"password" : "1234a"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generatepdf',
      apiUrl: 'https://api.dahobi.com/generatepdf',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDistrictByStateCall {
  static Future<ApiCallResponse> call({
    String? state = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get district by state',
      apiUrl:
          'https://nodejs-production-466d.up.railway.app/getDistrictsByState',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'statename': state,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? districtList(dynamic response) => getJsonField(
        response,
        r'''$.districts''',
        true,
      ) as List?;
}

class NewUserProfileSetFieldsCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'New User Profile Set Fields',
      apiUrl:
          'https://nodejs-production-466d.up.railway.app/newrecruiterprofileset/${userID}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class InstamojoCreatePaymentLinkCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
    String? paymentPlan = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userid": "${userID}",
  "paymentplan": "${paymentPlan}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Instamojo Create Payment Link',
      apiUrl: 'https://nodejs-production-d57c.up.railway.app/createpayment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic launchURL(dynamic response) => getJsonField(
        response,
        r'''$.paymentLink''',
      );
}

class GetCandidatesByLocationCall {
  static Future<ApiCallResponse> call({
    double? latitude,
    double? longitude,
    double? radius,
    String? eduLevel = '',
    String? gender = '',
    int? expFrom,
    int? expTill,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get candidates by location',
      apiUrl: 'https://nodejs-production-466d.up.railway.app/getcandidates',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'lat': latitude,
        'long': longitude,
        'gender': gender,
        'radius': radius,
        'eduLevel': eduLevel,
        'expFrom': expFrom,
        'expTill': expTill,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchCandidatesWithFiltersCall {
  static Future<ApiCallResponse> call({
    String? name = 'All',
    int? page = 1,
    String? gender = 'All',
    String? edulevel = 'All',
    String? state = 'All',
    String? district = 'All',
    int? salaryfrom,
    int? salaryto,
    int? yearsfrom,
    int? yearsto,
    String? type = '',
    String? subjects = '',
    String? degree = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'search candidates with filters',
      apiUrl: 'https://nodejs-production-466d.up.railway.app/searchCandidates',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'candidatename': name,
        'page': page,
        'canidatejobseekstate': state,
        'candidatejobseekdistrict': district,
        'highesteducationlevel': edulevel,
        'gender': gender,
        'jobseektype': type,
        'degree': degree,
        'yearsfrom': yearsfrom,
        'yearsto': yearsto,
        'expectedsalarymin': salaryfrom,
        'expectedsalarymax': salaryto,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CandidateDumpCall {
  static Future<ApiCallResponse> call({
    String? recruiterId = '',
    int? page,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'candidate dump',
      apiUrl: 'https://nodejs-production-466d.up.railway.app/getcandidatedump',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'recruiterId': recruiterId,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? novideoprofiles(dynamic response) => getJsonField(
        response,
        r'''$.novideo''',
        true,
      ) as List?;
  static List? videoprofiles(dynamic response) => getJsonField(
        response,
        r'''$.video''',
        true,
      ) as List?;
  static List? matchedProfiles(dynamic response) => getJsonField(
        response,
        r'''$.matched''',
        true,
      ) as List?;
}

class SaveCandidatesCall {
  static Future<ApiCallResponse> call({
    String? candidateid = '',
    String? recruiterid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Save Candidates',
      apiUrl:
          'https://nodejs-production-466d.up.railway.app/candidatesave/${candidateid}/${recruiterid}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? novideoprofiles(dynamic response) => getJsonField(
        response,
        r'''$.novideo''',
        true,
      ) as List?;
  static List? videoprofiles(dynamic response) => getJsonField(
        response,
        r'''$.video''',
        true,
      ) as List?;
  static List? matchedProfiles(dynamic response) => getJsonField(
        response,
        r'''$.matched''',
        true,
      ) as List?;
}

class VerifypaymentCall {
  static Future<ApiCallResponse> call({
    String? orderid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'verifypayment',
      apiUrl: 'https://nodejs-production-466d.up.railway.app/verifypayment',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'orderid': orderid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic paymentResponse(dynamic response) => getJsonField(
        response,
        r'''$.payment_response''',
      );
}

class CandidateSearchCall {
  static Future<ApiCallResponse> call({
    String? searchterm = '',
    int? page,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'candidate search',
      apiUrl: 'https://nodejs-production-466d.up.railway.app/candidatesearch',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'query': searchterm,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SendBulkMessagesToCandidatesCall {
  static Future<ApiCallResponse> call({
    String? userid = '',
    String? recruiterid = '',
    List<String>? candidatesList,
    String? message = '',
  }) async {
    final candidates = _serializeList(candidatesList);

    final ffApiRequestBody = '''
{
  "recruiterid": "${recruiterid}",
  "candidateList": ${candidates},
  "message": "${message}",
  "userid": "${userid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Bulk Messages to Candidates',
      apiUrl: 'https://nodejs-production-466d.up.railway.app/sendMessages',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SendBulkEMailCandidatesCall {
  static Future<ApiCallResponse> call({
    String? subject = '',
    String? recruiterid = '',
    List<String>? candidatesList,
    dynamic? dataJson,
  }) async {
    final candidates = _serializeList(candidatesList);
    final data = _serializeJson(dataJson);
    final ffApiRequestBody = '''
{
  "recruiterid": "${recruiterid}",
  "candidateList": ${candidates},
  "data": ${data},
  "subject": "${subject}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Bulk EMail Candidates',
      apiUrl:
          'https://nodejs-production-466d.up.railway.app/bulkMailCandidates',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CcAvenueCheckoutCall {
  static Future<ApiCallResponse> call({
    String? plan = '',
    String? supabaseid = '',
    String? env = '',
  }) async {
    final ffApiRequestBody = '''
{
  "package": "${plan}",
  "appName": "recruiter",
  "customerid": "${supabaseid}",
  "environment": "${env}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cc avenue checkout',
      apiUrl:
          'https://agile-ridge-02432.herokuapp.com/https://asia-south1-teachnear.cloudfunctions.net/ccavenuecheckout-1',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? launchUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  static dynamic orderid(dynamic response) => getJsonField(
        response,
        r'''$.orderid''',
      );
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
