//import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    // number of method calls to be displayed
    errorMethodCount: 8,
    // number of method calls if stacktrace is provided
    lineLength: 5,
    // width of the output
    colors: true,
    // Colorful log messages
    printEmojis: true,
    // Print an emoji for each log message
    printTime: true,
    // Should each log print contain a timestamp
    noBoxingByDefault: false,
  ),
  // printer: SimplePrinter(printTime: true, colors: true)
);

extension ImLoggerExtensions on Object {
  //todo: add || !kDebugMode
  logDebug(String? message) {
    if (message == null || message.isEmpty ) return;
    _logger.d(message);
  }

  logError({String? message, Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
