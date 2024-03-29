/// Declares feature flags and default settings
abstract class FeatureFlags {
  /// Whether the app requires login to use the app
  bool get anonymousAccess => false;

  /// Update any existing settings with values from the JSON object
  void update(final Map<String, dynamic> json);

  /// convert [FeatureFlag] object and its settings to a JSON object
  Map<String, dynamic> toJson();
}
