import '../../../../cleanboot.dart';
import '../../../../core/core.dart';

/// {@template DisplayNamesLocalDataSource}
/// Local display name data source
/// {@endtemplate}
abstract class DisplayNamesLocalDataSource {
  /// The key value used to store local display name data
  final KeyValueStore store;

  /// {@macro DisplayNamesLocalDataSource}
  DisplayNamesLocalDataSource(this.store);

  /// Initializes the local data source
  Future<void> init();

  /// Get in-use display name information for a user identifier
  Future<DisplayNameModel?> displayName(
    final String userIdentifier,
  );

  /// Get display name information for a list of user identifiers.
  ///
  /// If active is true, returns only display names currently in-use by app
  /// users. If [userIdentifiers] is not sent, it will return all display name
  /// data
  Future<List<DisplayNameModel>> displayNames({
    final List<String>? userIdentifiers,
    final bool active = true,
  });

  /// Save display names
  Future<void> saveDisplayNames(
    final List<DisplayNameModel> displayNames,
  );
}
