import 'package:cleanboot/core/errors/failures.dart';
import 'package:flutter_test/flutter_test.dart';

class TestFailure extends Failure {
  const TestFailure({super.description, super.reason, super.code});
}

void main() {
  group('Failure', () {
    test('should create a valid failure with default values when no parameters are passed', () {
      const failure = TestFailure();

      expect(failure.description, 'An unknown failure occurred');
      expect(failure.reason, 'An unknown failure occurred');
      expect(failure.code, 0);
    });

    test('should create a valid failure with the provided values', () {
      const failure = TestFailure(description: 'Test Description', reason: 'Test Reason', code: 12345);

      expect(failure.description, 'Test Description');
      expect(failure.reason, 'Test Reason');
      expect(failure.code, 12345);
    });
  });
}
