import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dependency_injection/dependency_injection.dart';
import 'modules/home/presentation/pages/home_page.dart';
import 'modules/launch/presentation/pages/launch_page.dart';
import 'routing/app_router.dart';

void main() async {
  final AppRouter appRouter = AppRouter(
    initialLocation: '/launch',
    routeProviders: [
      Pages(),
    ],
  );

  // DI
  final _ = await configureServices();

  runApp(
    MainApp(
      appRouter: appRouter,
      title: 'Flutter Bootstrapped App',
    ),
  );
}

/// {@template MainApp}
/// Entry-point for the application
/// {@endtemplate}
class MainApp extends StatelessWidget {
  /// {@macro MainApp}
  const MainApp({
    super.key,
    required this.appRouter,
    required this.title,
  });

  /// Provides widgets to which a user can navigate
  final AppRouter appRouter;

  /// Title of the application
  final String title;

  @override
  Widget build(final BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.router(),
      title: title,
    );
  }
}

/// Defines pages to which a user can route
class Pages extends RouteProvider {
  @override
  List<GoRoute> routes() => [
        _homeRoute(),
        _launchRoute(),
      ];

  GoRoute _homeRoute() => GoRoute(
        path: '/',
        builder: (final context, final state) => const HomePage(),
      );

  GoRoute _launchRoute() => GoRoute(
        path: '/launch',
        builder: (final context, final state) => const LaunchPage(),
      );
}
