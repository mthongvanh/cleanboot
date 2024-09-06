/// Parameters for fetching the application's display names
class GetDisplayNamesParams {
  /// Cache type when fetching data locally or remotely
  final String? cacheType;

  /// Whether to retrieve only in-use display names vs inactive display names
  final bool active;

  /// Parameters for fetching the application's display names
  GetDisplayNamesParams({
    this.cacheType,
    this.active = true,
  });
}
