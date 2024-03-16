import 'package:cleanboot/modules/auth/domain/params/auth_params.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthParams', () {
    test('should have identifier and secret properties when created', () {
      final authParams =
          AuthParams(identifier: 'testIdentifier', secret: 'testSecret');

      expect(authParams.identifier, equals('testIdentifier'));
      expect(authParams.secret, equals('testSecret'));
    });

    test('should return correct props', () {
      final authParams =
          AuthParams(identifier: 'testIdentifier', secret: 'testSecret');

      expect(
        authParams.props,
        equals([
          'testIdentifier',
          'testSecret',
        ]),
      );
    });
  });
}
