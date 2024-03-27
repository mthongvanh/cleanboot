import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl_standalone.dart';

import '../../domain/repositories/locale_repository.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final Locale _defaultLocale = const Locale('en');

  AppLocalizations? _strings;

  @override
  AppLocalizations get strings => _strings!;

  @override
  bool get isLoaded => _strings != null;

  @override
  bool get isEnglish => strings.localeName == 'en';

  @override
  Future<void> load() async {
    Locale locale = _defaultLocale;
    // final localeCode = settingsLogic.currentLocale.value ?? await findSystemLocale();
    final localeCode = await findSystemLocale();
    locale = Locale(localeCode.split('_')[0]);
    if (kDebugMode) {
      // locale = Locale('zh'); // uncomment to test chinese
    }
    if (AppLocalizations.supportedLocales.contains(locale) == false) {
      locale = _defaultLocale;
    }

    // settingsLogic.currentLocale.value = locale.languageCode;
    _strings = await AppLocalizations.delegate.load(locale);
  }

  @override
  Future<void> loadIfChanged(final Locale locale) async {
    bool didChange = _strings?.localeName != locale.languageCode;
    if (didChange && AppLocalizations.supportedLocales.contains(locale)) {
      _strings = await AppLocalizations.delegate.load(locale);
    }
  }
}
