import '../../data/models/display_name_model.dart';

/// {@template DisplayNamesRemoteDataSource}
/// Remote display name data source
/// {@endtemplate}
abstract class DisplayNamesRemoteDataSource {
  /// Initializes the local data source
  Future<void> init();

  /// Get display name information for a user identifier
  Future<DisplayNameModel> displayName(final String userIdentifier);

  /// Get display name information for a list of user identifiers
  ///
  /// If [userIdentifiers] is not sent, it will return all display name data
  Future<List<DisplayNameModel>> displayNames([
    final List<String>? userIdentifiers,
  ]);

  /// Save display names
  Future<void> saveDisplayNames(final List<Map<String, Object>> displayNames);

  /// Stream new display names added to the name collection
  Future<Stream<List<DisplayNameModel>>> streamDisplayNames([
    final int? newerThan,
  ]);
}
