import 'fr_http_export.dart';

class RRHelper {
  final Request _request;
  String method;
  RRHelper(this._request, this.method);

  RRHelper addHeader(String key, String value) {
    _request.headers[key] = value;
    return this;
  }

  RRHelper addQueryParam(String key, String value) {
    _request.url.queryParameters[key] = value;
    return this;
  }

}
