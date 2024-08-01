import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';

import '../../dependency_injection/domain/firebase_options.dart';
import 'log.dart';

/// Implements logging via Firebase
class FirebaseLoggingImpl extends LoggingService {
  /// Performance logger
  static final FirebasePerformance _performance = FirebasePerformance.instance;
  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  final _traces = <String, Trace>{};

  @override
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  void log(
    final LogLevel level,
    final String message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) {
    switch (level) {
      case LogLevel.debug:
        _logDebug(message);
      case LogLevel.info:
        _logInfo(message);
      case LogLevel.warning:
        _logWarning(message);
      case LogLevel.error:
        _logError(message, error, stackTrace);
      case LogLevel.fatal:
        _logFatal(message, error, stackTrace);
    }
  }

  void _logDebug(final String message) {
    unawaited(_crashlytics.log(message));
  }

  void _logInfo(final String message) {
    unawaited(_crashlytics.log(message));
  }

  void _logWarning(final String message) {
    unawaited(_crashlytics.log(message));
  }

  void _logError(
    final String message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) {
    unawaited(_crashlytics.recordError(error, stackTrace, reason: message));
  }

  void _logFatal(
    final String message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) {
    unawaited(
      _crashlytics.recordError(
        error,
        stackTrace,
        fatal: true,
        reason: message,
      ),
    );
  }

  @override
  Future<void> startTrace(final String identifier) async {
    if (_traces.containsKey(identifier)) {
      throw Exception(
        'A trace with identifier $identifier has already been initiated',
      );
    }

    final trace = _performance.newTrace(identifier);
    _traces[identifier] = trace;
    await trace.start();
  }

  @override
  Future<void> stopTrace(final String identifier) async {
    final trace = _traces[identifier];
    await trace?.stop();
    _traces.remove(identifier);
  }
}
