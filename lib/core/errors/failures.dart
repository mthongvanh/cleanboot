import 'package:equatable/equatable.dart';

export 'auth/auth_failure.dart';
export 'filters/filters_failure.dart';
export 'l10n/locale_load_failure.dart';

/// {@template Failure}
/// Base class to describe failed operations
/// {@endtemplate}
abstract class Failure extends Equatable {
  /// Description of failure, eg: Login failed
  final String? description;

  /// Reason for failure: eg: User not found
  final String? reason;

  /// Error code that identifies the failure
  final int? code;

  /// {@macro Failure}
  const Failure({
    this.description = 'An unknown failure occurred',
    this.reason = 'An unknown failure occurred',
    this.code = 0,
  });

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

/// Base failure codes
enum FailureCode {
  /// base auth failure code
  auth(8000),

  /// base paintz fetch failure code
  fetchPaintz(11000),

  /// base filters failure code
  filters(13000),

  /// base image generation failure code
  generateImage(9000),

  /// base options failure code
  getOptions(12000),

  /// base locale failure code
  locale(7000),

  /// base paintz saving failure code
  savePaintz(10000);

  /// Error code [int] value
  final int value;

  const FailureCode(this.value);
}
