import 'package:clean_bootstrap/core/errors/auth/auth_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthFailure', () {
    late AuthFailure authFailure;

    setUp(() {
      authFailure = AuthFailure.invalidCredentials(
        description: 'Test description',
        reason: 'Test reason',
      );
    });

    test('should have the correct description', () {
      expect(authFailure.description, 'Test description');
    });

    test('should have the correct reason', () {
      expect(authFailure.reason, 'Test reason');
    });

    test('should have the correct code', () {
      expect(authFailure.code, 8000);
    });

    group('when description is null', () {
      setUp(() {
        authFailure = AuthFailure.invalidCredentials(reason: 'Test reason');
      });

      test('should have a default description', () {
        expect(authFailure.description, 'Login failed (8000)');
      });
    });

    group('when reason is null', () {
      setUp(() {
        authFailure =
            AuthFailure.invalidCredentials(description: 'Test description');
      });

      test('should have a default reason', () {
        expect(authFailure.reason, 'Login failed due to invalid credentials');
      });
    });
  });
}
