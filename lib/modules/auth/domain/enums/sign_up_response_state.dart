/// Represents the sign-up state
enum SignUpResponseState {
  /// Sign-up has initialized and ready for updates
  initialized,

  /// Sign-up has finished initialization and all other pending actions
  idle,

  /// Sign-up is in process
  processing,

  /// Sign-up completed successfully
  success,

  /// Sign-up completed with a failure
  failure,
}
