import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl_standalone.dart';

/// Loads and stores localized strings
abstract class LocaleRepository {
  final Locale _defaultLocale = const Locale('en');

  AppLocalizations? _strings;

  /// Collection of localized strings
  AppLocalizations get strings;

  /// Whether localizations have been loaded
  bool get isLoaded;

  /// Whether the current locale is English
  bool get isEnglish;

  /// Loads localized strings
  Future<void> load();

  /// Loads localized strings for a specified locale
  Future<void> loadIfChanged(final Locale locale);
}
