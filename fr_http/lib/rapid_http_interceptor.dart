import 'rapid_http_exception.dart';
import 'rapid_request_response.dart';
import 'rapid_rr_helper.dart';

abstract class HTTPInterceptor {
  void beforeRequest(RRHelper rrHelper);
  void afterResponse(RRHelper rrHelper, HTTPResponse response);
  void onException(RRHelper rrHelper, HTTPException exception);
}
