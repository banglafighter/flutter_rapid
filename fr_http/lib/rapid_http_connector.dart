import 'dart:convert';
import 'dart:io';
import 'fr_http_export.dart' as http;
import 'fr_http_export.dart';
import 'rapid_http_exception.dart';
import 'rapid_http_interceptor.dart';
import 'rapid_request_response.dart';
import 'rapid_rr_helper.dart';

class HTTPConnector {
  static const APPLICATION_JSON = "application/json";
  static const CONTENT_TYPE = "Content-Type";
  static const GET = "GET";
  static const POST = "POST";
  static const PUT = "PUT";
  static const DELETE = "DELETE";
  static const regularType = "regular";
  static const uploadType = "upload";

  Map<String, String> _headers = {};
  HTTPInterceptor? httpInterceptor;
  String? baseUrl;

  HTTPConnector({this.httpInterceptor, this.baseUrl});

  Request _prepareRegularRequest(method, uri, Object? data) {
    Request request = http.Request(method, uri);

    var encoding = Encoding.getByName("utf-8");
    request.encoding = encoding!;

    if ((method == GET || method == DELETE) && data is Map) {
      // Ignore
    } else if (data is String) {
      request.body = data;
    } else if (data is Map) {
      request.bodyFields = Map<String, String>.from(data);
    }
    return request;
  }

  Future<http.MultipartFile> _getMultipartFileInfo(File file, String fieldName) async {
    return await http.MultipartFile.fromPath(fieldName, file.path);
  }

  MultipartRequest _prepareUploadRequest(method, uri, Map<String, File>? files, Object? data) {
    MultipartRequest request = http.MultipartRequest(method, uri);
    if (data is Map) {
      request.fields.addAll(Map<String, String>.from(data!));
    }

    if (files is Map) {
      files?.forEach((name, file) async {
        if (name is String && file is File && await file.exists()) {
          http.MultipartFile multipartFile = await _getMultipartFileInfo(file, name);
          if (multipartFile is http.MultipartFile) {
            request.files.add(multipartFile);
          }
        }
      });
    }
    return request;
  }

  Future<HTTPResponse> _jsonRequest(String url, String method, {Map<String, dynamic>? data}) async {
    try {
      addHeader(CONTENT_TYPE, APPLICATION_JSON);
      String? jsonString;
      if (data is Map) {
        jsonString = json.encode(data);
      }
      return await _requestTo(url, method, data: jsonString);
    } on Exception catch (e) {
      throw HTTPException(message: "$e");
    }
  }


  Future<HTTPResponse> _requestTo(String url, String method, {Object? data, Map<String, File>? files, String requestType = regularType}) async {
    RRHelper? rrHelper;
    try {
      var uri = Uri.parse(url);

      if ((method == GET || method == DELETE) && data is Map) {
        var queryParams = Map<String, dynamic>.from(data);
        queryParams.addAll(uri.queryParameters);
        uri = uri.replace(queryParameters: queryParams);
      }

      var request;
      if (requestType == uploadType) {
        request = _prepareUploadRequest(method, uri, files, data);
      } else {
        request = _prepareRegularRequest(method, uri, data);
      }

      request.headers.addAll(_headers);

      rrHelper = RRHelper(request, method);
      if (httpInterceptor != null) {
        httpInterceptor!.beforeRequest(rrHelper);
      }

      final response = await request.send();
      HTTPResponse httpResponse = HTTPResponse(
        statusCode: response.statusCode,
        body: await response.stream.bytesToString(),
      );

      if (httpInterceptor != null) {
        httpInterceptor!.afterResponse(rrHelper, httpResponse);
      }

      return httpResponse;
    } on Exception catch (e) {
      var exception = HTTPException(message: "$e");
      if (httpInterceptor != null) {
        httpInterceptor!.onException(rrHelper!, exception);
      }
      throw exception;
    }
  }

  HTTPConnector setBaseUrl(String _baseUrl) {
    baseUrl = _baseUrl;
    return this;
  }

  HTTPConnector addHeader(String key, String value) {
    _headers[key] = value;
    return this;
  }

  Map<String, String> getHeaders() {
    return _headers;
  }

  HTTPConnector clearHeader() {
    _headers = {};
    return this;
  }

  Future<HTTPResponse> get(String url, {Map<String, dynamic>? params}) async {
    return await _requestTo(url, GET, data: params);
  }

  Future<HTTPResponse> post(String url, {Map<String, dynamic>? data}) async {
    return await _requestTo(url, POST, data: data);
  }

  Future<HTTPResponse> put(String url, {Map<String, dynamic>? data}) async {
    return await _requestTo(url, PUT, data: data);
  }

  Future<HTTPResponse> delete(String url, {Map<String, dynamic>? data}) async {
    return await _requestTo(url, DELETE, data: data);
  }

  Future<HTTPResponse> upload(String url, Map<String, File> files, {Map<String, dynamic>? data}) async {
    return await _requestTo(url, POST, data: data, files: files, requestType: uploadType);
  }

  Future<HTTPResponse> jsonPost(String url, {Map<String, dynamic>? data}) async {
    return await _jsonRequest(url, POST, data: data);
  }

  Future<HTTPResponse> jsonPut(String url, {Map<String, dynamic>? data}) async {
    return await _jsonRequest(url, PUT, data: data);
  }

  Future<HTTPResponse> jsonDelete(String url, {Map<String, dynamic>? data}) async {
    return await _jsonRequest(url, DELETE, data: data);
  }

}
