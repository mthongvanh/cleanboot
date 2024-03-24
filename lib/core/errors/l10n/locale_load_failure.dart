import '../failures.dart';

/// {@template LocaleLoadFailure}
/// Describes a failure encountered while loading a locale
/// {@endtemplate}
class LocaleLoadFailure extends Failure {
  const LocaleLoadFailure._({
    super.description,
    super.reason,
    super.code,
  });

  /// Auth credentials were invalid
  factory LocaleLoadFailure({
    final String? description,
    final String? reason,
    final int? code,
  }) =>
      LocaleLoadFailure._(
        description: description ?? 'Localized strings failed to load (7000)',
        reason: reason ?? 'Encountered an unknown error loading localized strings',
        code: code ?? 7000,
      );
}
