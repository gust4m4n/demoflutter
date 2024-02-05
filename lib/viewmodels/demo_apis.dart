import 'demo_preferences_vm+users.dart';
import 'demo_session_vm.dart';
import '../utils/api_x.dart';
import 'demo_baseurl_vm.dart';

class DemoApiResponse extends ApiXResponse {
  DemoApiResponse(ApiXResponse resp) {
    headers = resp.headers;
    statusCode = resp.statusCode;
    body = resp.body;
    jason = resp.jason;
    message = resp.message;
  }
}

class DemoApi {
  static Future<DemoApiResponse> get(
      {required String endpoint,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    final accessToken = await DemoUserPreferencesVM.getToken();
    if (accessToken.isNotEmpty) {
      newHeaders['Authorization'] = 'Bearer $accessToken';
    }
    return ApiX.get(
            url: contract == false
                ? DemoBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders)
        .then((resp) {
      final response = DemoApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static Future<DemoApiResponse> post(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      bool json = false,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    final accessToken = await DemoUserPreferencesVM.getToken();
    if (accessToken.isNotEmpty) {
      newHeaders['Authorization'] = 'Bearer $accessToken';
    }
    return ApiX.post(
            url: contract == false
                ? DemoBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders,
            json: json)
        .then((resp) {
      final response = DemoApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static Future<DemoApiResponse> delete(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    final accessToken = await DemoUserPreferencesVM.getToken();
    if (accessToken.isNotEmpty) {
      newHeaders['Authorization'] = 'Bearer $accessToken';
    }
    return ApiX.delete(
            url: contract == false
                ? DemoBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders)
        .then((resp) {
      final response = DemoApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static Future<DemoApiResponse> put(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      bool json = false,
      String contractFile = '',
      bool mock = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    final accessToken = await DemoUserPreferencesVM.getToken();
    if (accessToken.isNotEmpty) {
      newHeaders['Authorization'] = 'Bearer $accessToken';
    }

    return ApiX.put(
            url: mock == false ? DemoBaseUrlVM.apiUrl(endpoint) : contractFile,
            params: params,
            headers: newHeaders,
            json: json)
        .then((resp) {
      final response = DemoApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static Future<DemoApiResponse> postMultipart(
      {required String endpoint,
      Map<String, String?>? files,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    final accessToken = await DemoUserPreferencesVM.getToken();
    if (accessToken.isNotEmpty) {
      newHeaders['Authorization'] = 'Bearer $accessToken';
    }
    return ApiX.postMultipart(
            url: contract == false
                ? DemoBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            files: files,
            params: params,
            headers: newHeaders)
        .then((resp) {
      final response = DemoApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static Future<DemoApiResponse> putMultipart(
      {required String endpoint,
      Map<String, String?>? files,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    final accessToken = await DemoUserPreferencesVM.getToken();
    if (accessToken.isNotEmpty) {
      newHeaders['Authorization'] = 'Bearer $accessToken';
    }
    return ApiX.putMultipart(
            url: contract == false
                ? DemoBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            files: files,
            params: params,
            headers: newHeaders)
        .then((resp) {
      final response = DemoApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static handleResponse(DemoApiResponse resp) async {
    if (resp.statusCode == 401 ||
        resp.statusCode == 403 ||
        resp.jason['error'].stringValue == '401' ||
        resp.jason['error'].stringValue == '403') {
      await DemoSessionVM.logout();
    }
  }
}
