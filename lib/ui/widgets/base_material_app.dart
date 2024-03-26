import 'package:flutter/material.dart';

import '../../modules/l10n/data/gen_l10n/base_localizations.dart';
import '../../routing/app_router.dart';
import '../styles/material_theme.dart';

/// Base application container
class BaseMaterialApp extends StatelessWidget {
  /// [Key] name used to identify the widget
  static String keyName = 'BaseMaterialApp';

  /// App title
  final String title;

  /// Router
  final AppRouter appRouter;

  /// Theme
  final MaterialTheme appTheme;

  /// Supported localizations
  final List<LocalizationsDelegate<dynamic>>? localizationDelegates;

  /// Supported locales
  final List<Locale>? locales;

  /// Creates a [BaseMaterialApp] widget that contains the app
  const BaseMaterialApp({
    required this.title,
    required this.appRouter,
    required this.appTheme,
    this.localizationDelegates,
    this.locales,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.routerConfig(),
      title: title,
      // debugShowCheckedModeBanner: false,
      theme: appTheme.light(),
      darkTheme: appTheme.dark(),
      localizationsDelegates: {
        if (localizationDelegates != null) ...localizationDelegates!.toSet(),
        ...BaseLocalizations.localizationsDelegates,
      },
      supportedLocales: {
        if (locales != null) ...locales!.toSet(),
        ...BaseLocalizations.supportedLocales,
      },
    );
  }
}
