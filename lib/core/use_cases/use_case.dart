import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

/// Action executed in the application
abstract class UseCase<Type, Params> {
  /// Execute the use case
  Future<(Failure?, Type?)> execute(final Params params);
}

/// Empty parameters
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
