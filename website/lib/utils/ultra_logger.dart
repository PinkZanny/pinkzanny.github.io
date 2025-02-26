import 'dart:convert';

import 'package:flutter/material.dart';

class UltraLogger {
  static String successDebug = '--------------------- SUCCESS ---------------------';
  static String failureDebug = '--------------------- FAILURE ---------------------';
  static String endDebug = '---------------------------------------------------';
  static String fatal = '[FATAL] ';
  static String error = '[ERROR] ';
  static String warn = '[WARN] ';
  static String debug = '[DEBUG] ';
  static String info = '[INFO] ';
  static String trace = '[TRACE] ';

  static void logSuccessApi({required final String endpoint, required final Map<dynamic, dynamic> body}) {
    debugPrint(UltraLogger.trace + UltraLogger.successDebug);
    debugPrint(endpoint);
    debugPrint(const JsonEncoder.withIndent(' ').convert(body));
    debugPrint(UltraLogger.trace + UltraLogger.endDebug);
  }

  static void logErrorApi({required final String endpoint, required final Map<dynamic, dynamic> body}) {
    debugPrint(UltraLogger.error + UltraLogger.failureDebug);
    debugPrint(endpoint);
    debugPrint(const JsonEncoder.withIndent(' ').convert(body));
    debugPrint(UltraLogger.error + UltraLogger.endDebug);
  }

  static void logSuccess(final String message) {
    debugPrint(UltraLogger.trace + message);
  }

  static void logFatal(final message) {
    debugPrint(UltraLogger.fatal + message);
  }

  static void logError(final String message) {
    debugPrint(UltraLogger.error + message);
  }

  static void logWarn(final String message) {
    debugPrint(UltraLogger.warn + message);
  }

  static void logDebug(final String message) {
    debugPrint(UltraLogger.debug + message);
  }

  static void logInfo(final String message) {
    debugPrint(UltraLogger.info + message);
  }

  static void trackTime(final Function() function, final String name) {
    final Stopwatch stopwatch = Stopwatch()..start();
    function();
    stopwatch.stop();
    UltraLogger.logDebug('$name took ${stopwatch.elapsedMilliseconds}ms');
  }
}
