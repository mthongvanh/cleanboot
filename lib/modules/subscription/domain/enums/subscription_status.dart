/// Represents the subscription process state
enum SubscriptionStatus {
  /// Subscription query has initialized and is ready for updates
  initialized,

  /// Subscription query is idle, waiting for user action
  idle,

  /// Subscription purchase or restoration is in process
  processing,

  /// Subscription purchase or update completed successfully
  success,

  /// Subscription purchase or update completed with a failure
  failure,
}
