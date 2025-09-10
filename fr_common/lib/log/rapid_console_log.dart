import 'package:logger/logger.dart';
import 'rapid_log_enum.dart';


class RLog {
  static final RLog _singleton = RLog._internal();
  late final Logger _logger;
  static LogLevel logLevel = LogLevel.all;
  static bool enableLog = false;

  factory RLog() {
    return _singleton;
  }

  RLog._internal() {
    _logger = Logger(
      printer: PrettyPrinter(methodCount: 0, lineLength: 85),
    );
    _initLogLevel();
  }

  void _initLogLevel() {
    switch(logLevel){
      case LogLevel.info:{ Logger.level = Level.info; }
      break;

      case LogLevel.debug:{ Logger.level = Level.debug; }
      break;

      case LogLevel.error:{ Logger.level = Level.error; }
      break;

      case LogLevel.warning:{ Logger.level = Level.warning; }
      break;

      default:
        Logger.level = Level.trace;
    }
  }

  void _printLog(Level level, dynamic message, { DateTime? time, Object? error, StackTrace? stackTrace}){
    if(!enableLog){
      return;
    }
    _logger.log(level, message, time: time, error: error, stackTrace: stackTrace);
  }

  static RLog _instance() {
    return RLog();
  }

  static void print(dynamic message, { DateTime? time, Object? error, StackTrace? stackTrace}){
    return _instance()._printLog(Level.debug, message, time: time, error: error, stackTrace: stackTrace);
  }

  static void info(dynamic message, { DateTime? time, Object? error, StackTrace? stackTrace}){
    return _instance()._printLog(Level.info, message, time: time, error: error, stackTrace: stackTrace);
  }

  static void error(dynamic message, { DateTime? time, Object? error, StackTrace? stackTrace}){
    return _instance()._printLog(Level.error, message, time: time, error: error, stackTrace: stackTrace);
  }

  static void warning(dynamic message, { DateTime? time, Object? error, StackTrace? stackTrace}){
    return _instance()._printLog(Level.warning, message, time: time, error: error, stackTrace: stackTrace);
  }

}