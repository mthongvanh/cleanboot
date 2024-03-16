import 'package:flutter_test/flutter_test.dart';
import 'package:cleanboot/routing/data/models/route_params.dart';

void main() {
  test(
    'Route params are valid',
    () {
      final params = RouteParams();
      final mappedValues = params.toJson();
      expect(mappedValues.containsKey("test"), isTrue);
      expect(mappedValues['test'], 'value');
    },
  );
}
