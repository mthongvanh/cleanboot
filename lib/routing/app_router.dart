import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

export 'data/data.dart';

/// {@template AppRouter}
/// Defines routes for the application
/// {@endtemplate}
abstract class AppRouter {
  /// Root navigator state key
  static GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  /// Nested navigator state key
  static GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  /// {@macro AppRouter}
  AppRouter({
    required this.routeProviders,
  });

  /// {@macro AppRouter}
  RouterConfig<Object> routerConfig() => throw UnimplementedError();

  /// Provide route-able widgets
  final List<RouteProvider> routeProviders;

  /// Navigate to a route
  void go(
    final BuildContext context, {
    required final String routePath,
    final Map<String, Object>? routeParameters,
  }) =>
      throw UnimplementedError(
        'routers must implement the go function',
      );

  /// Navigate to a route
  void goNamed(
    final BuildContext context, {
    required final String routeName,
    final Map<String, Object>? routeParameters,
  }) =>
      throw UnimplementedError(
        'routers must implement the goNamed function',
      );

  /// Push a new route on top of the stack
  Future<T?> push<T>(
    final BuildContext context, {
    required final String routeIdentifier,
    final Map<String, Object>? routeParameters,
  }) =>
      throw UnimplementedError(
        'routers must implement the push function',
      );
}

/// Provides widgets to which an application can navigate
abstract class RouteProvider {
  /// Widgets to which an application can navigate
  List<GoRoute> routes();

  /// Stateful navigators used by navigation components
  List<StatefulShellBranch> branches();
}
