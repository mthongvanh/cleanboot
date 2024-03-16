import 'package:equatable/equatable.dart';

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
