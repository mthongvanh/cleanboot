import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

/// Convenience type alias for use case responses
typedef ApiResponse<Type> = ({Failure? failure, Type? result});

/// Action executed in the application
abstract class UseCase<Type, Params> {
  /// Execute the use case
  Future<({Failure? failure, Type? result})> execute(final Params params);
}

/// Empty parameters
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
