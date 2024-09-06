/// Base class that provides configuration options during app initialization
abstract class AppInitConfig {
  /// Whether firebase should get initialized
  bool get firebaseEnabled => false;

  /// Whether the default auth classes using firebase should be registered with
  /// the service locator
  bool get firebaseAuthEnabled => false;

  /// Whether the default logging service implementation using firebase should
  /// be registered with the service locator
  bool get firebaseLoggingEnabled => false;

  /// Whether revenue cat requires initialization
  bool get revenueCatEnabled => false;

  /// Store name for display names
  static const displayNameStore = 'displayNameStore';
}
