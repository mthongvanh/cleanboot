import 'package:clean_bootstrap/core/errors/auth/auth_failure.dart';
import 'package:clean_bootstrap/core/errors/failures.dart';
import 'package:clean_bootstrap/core/use_cases/use_case.dart';
import 'package:clean_bootstrap/modules/auth/domain/entities/auth_result.dart';
import 'package:flutter_test/flutter_test.dart';

class UseCaseImpl implements UseCase<AuthResult, NoParams> {
  UseCaseImpl();
  
  @override
  Future<(Failure?, AuthResult?)> execute(final NoParams params) async {
    return (null, const AuthResult());
  }
}

void main() {
  group('UseCase', () {
    test('execute method returns a Failure when Params are null', () async {
      // Setup
      final useCase = UseCaseImpl();
      
      // Execute
      final result = await useCase.execute(NoParams());

      // Assert
      expect(result, isNotNull);
      expect(result.$1, isA<Failure>());
    });
    
    test('execute method returns a Failure when Params are not null', () async {
      // Setup
      final useCase = UseCaseImpl();
      
      // Execute
      final result = await useCase.execute(ParamsImpl());

      // Assert
      expect(result, isNotNull);
      expect(result![0], isA<Failure>());
    });
    
    test('execute method returns a Type when Params are not null', () async {
      // Setup
      final useCase = UseCaseImpl();
      
      // Execute
      final result = await useCase.execute(ParamsImpl());

      // Assert
      expect(result, isNotNull);
      expect(result![1], isA<Type>());
    });
  });
  
  group('NoParams', () {
    test('props returns an empty list', () {
      // Setup
      final noParams = NoParams();
      
      // Execute
      final result = noParams.props;

      // Assert
      expect(result, isNotNull);
      expect(result, isEmpty);
    });
  });
}
