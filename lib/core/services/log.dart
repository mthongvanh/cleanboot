import 'dart:async';

/// Log events to external logging service
abstract class LoggingService with PerformanceLogger {
  /// Initialize the logging service
  FutureOr<void> init();

  /// Log an event to the logging service
  void log(
    final LogLevel level,
    final String message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]);
}

/// Log performance metrics
mixin PerformanceLogger {
  /// Begin performance trace
  Future<void> startTrace(final String identifier);

  /// Stop a trace
  Future<void> stopTrace(final String identifier);
}

/// Log level types
enum LogLevel {
  /// Debug event
  debug,

  /// Informational event
  info,

  /// Warning
  warning,

  /// Error
  error,

  /// Fatal event
  fatal,
}
