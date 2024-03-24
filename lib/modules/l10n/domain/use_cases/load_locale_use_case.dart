import '../../../../core/errors/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repositories/locale_repository.dart';

/// {@template LoadLocaleUseCase}
/// Loads localized strings for a locale
/// {@endtemplate}
class LoadLocaleUseCase extends UseCase<void, NoParams> {

  final LocaleRepository _localeRepository;

  /// {@macro LoadLocaleUseCase}
  LoadLocaleUseCase(this._localeRepository) : super();

  @override
  Future<({Failure? failure, void result})> execute(final NoParams params) async {
    LocaleLoadFailure? failure;
    try {
      await _localeRepository.load();
    } catch (e) {
      failure = LocaleLoadFailure(
        description: e.toString(),
      );
    }
    return (failure: failure, result: null);
  }
}