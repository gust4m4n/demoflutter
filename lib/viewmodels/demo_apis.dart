import '../utils/api_x.dart';
import 'demo_baseurl_vm.dart';
import 'demo_profile_vm.dart';

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
  static addRequiredHeader(Map<String, Object?> header) async {
    header['X-DEVICE-ID'] = 'deviceid';
    final token = DemoProfileVM.profile.token;
    if (token.isNotEmpty) {
      header['Authorization'] = 'Bearer $token';
    }
  }

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
    await addRequiredHeader(newHeaders);
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
    await addRequiredHeader(newHeaders);
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
    await addRequiredHeader(newHeaders);
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
    await addRequiredHeader(newHeaders);
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
    await addRequiredHeader(newHeaders);
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
    await addRequiredHeader(newHeaders);
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
    if (resp.statusCode == 401) {
      await DemoProfileVM.logout();
    }
  }
}
