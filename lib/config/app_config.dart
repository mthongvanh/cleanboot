/// Base class that provides configuration options during app initialization
abstract class AppInitConfig {
  /// Whether firebase should get initialized
  bool get firebaseEnabled => false;

  /// Whether the default auth classes using firebase should be registered with
  /// the service locator
  bool get firebaseAuthEnabled => false;

  /// Whether revenue cat requires initialization
  bool get revenueCatEnabled => false;
}