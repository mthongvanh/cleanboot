import 'package:go_router/go_router.dart';

/// {@template AppRouter}
/// Defines routes for the application
/// {@endtemplate}
class AppRouter {
  /// {@macro AppRouter}
  AppRouter({
    this.initialLocation,
    required this.routeProviders,
  });

  /// Initial location
  final String? initialLocation;

  /// Provide routeable widgets
  final List<RouteProvider> routeProviders;

  /// {@macro AppRouter}
  GoRouter router() {
    final routes = <GoRoute>[];

    for (final rp in routeProviders) {
      routes.addAll(rp.routes());
    }

    // ensure one root route exists
    assert(
      routes
          .where(
            (final element) => element.path == '/',
          )
          .isNotEmpty,
    );

    return GoRouter(
      initialLocation: initialLocation,
      routes: routes,
    );
  }
}

/// Provides widgets to which an application can navigate
abstract class RouteProvider {
  /// Widgets to which an application can navigate
  List<GoRoute> routes();
}
