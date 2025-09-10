import 'package:fr_common/log/rapid_console_log.dart';

class HTTPException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  HTTPException({
    required this.message,
    this.stackTrace,
  }) {
    RLog.error(message, stackTrace: stackTrace);
  }

  @override
  String toString() {
    return message;
  }
}
