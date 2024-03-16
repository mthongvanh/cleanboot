import 'package:flutter_test/flutter_test.dart';
import 'package:clean_bootstrap/routing/app_router.dart';

void main() {
  test(
    'initial test',
    () {
      final appRouter = AppRouter();
      expect(appRouter, isNotNull);
    },
  );
}
