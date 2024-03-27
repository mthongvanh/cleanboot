import '../../../cleanboot.dart';
import '../data/repositories/locale_repository_impl.dart';

/// Registers localization dependencies and injects required dependencies into
/// localization-related classes
class LocaleInjector {
  /// Configure localization dependencies
  static Future<void> configureDependencies(final ServiceLocator sl) async {
    // register repos
    final localeRepo = LocaleRepositoryImpl();
    await localeRepo.load();

    sl
      ..registerSingleton<LocaleRepository>(localeRepo)
      // register use cases
      ..registerSingleton<LoadLocaleUseCase>(
        LoadLocaleUseCase(localeRepo),
      );
  }
}
