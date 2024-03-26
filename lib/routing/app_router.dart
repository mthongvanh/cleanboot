import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// {@template AppRouter}
/// Defines routes for the application
/// {@endtemplate}
abstract class AppRouter {
  /// {@macro AppRouter}
  AppRouter({
    required this.routeProviders,
  });

  /// {@macro AppRouter}
  RouterConfig<Object> routerConfig() => throw UnimplementedError();

  /// Provide route-able widgets
  final List<RouteProvider> routeProviders;
}

/// Provides widgets to which an application can navigate
abstract class RouteProvider {
  /// Widgets to which an application can navigate
  List<GoRoute> routes();
}
