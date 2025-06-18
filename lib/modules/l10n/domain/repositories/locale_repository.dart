import 'dart:ui';

/// Loads and stores localized strings
abstract class LocaleRepository<T> {
  final Locale _defaultLocale = const Locale('en');

  /// Collection of localized strings
  T get strings;

  /// Whether localizations have been loaded
  bool get isLoaded;

  /// Whether the current locale is English
  bool get isEnglish;

  /// Loads localized strings
  Future<void> load();

  /// Loads localized strings for a specified locale
  Future<void> loadIfChanged(final Locale locale);
}
