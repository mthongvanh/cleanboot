import '../../../auth/domain/params/display_name_exists_params.dart';
import '../../../auth/domain/params/get_display_names_params.dart';
import '../entities/display_name.dart';

/// {@template DisplayNamesRepository}
/// Provides access to [DisplayName] data
/// {@endtemplate}
abstract class DisplayNamesRepository {
  /// Start listening for new display names
  Future<void> subscribeDisplayNames();

  /// Get a list of all display names created
  Future<List<DisplayName>> getDisplayNames(
    final GetDisplayNamesParams params,
  );

  /// Get a display name by the user identifier
  Future<DisplayName?> getDisplayName(final String userIdentifier);

  /// Get active display names
  Future<Map<String, DisplayName>?> getActiveDisplayNames();

  /// Checks whether the display name exists already
  Future<bool> displayNameExists(final DisplayNameExistsParams params);
}
