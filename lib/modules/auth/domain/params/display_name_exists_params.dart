/// Parameters used to check whether a display name exists
class DisplayNameExistsParams {

  /// Display name to look up
  final String displayName;

  /// Optional user identifier attached to the display name
  final String? userIdentifier;

  /// Cache type used when looking up the display name
  final String? cacheType;

  /// Parameters used to check whether a display name exists
  const DisplayNameExistsParams(
    this.displayName, {
    this.cacheType,
    this.userIdentifier,
  });
}
