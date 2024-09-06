import 'dart:async';

/// {@template KeyValueStore}
/// An abstract interface for a key-value store.
///
/// This interface defines the standard operations for a key-value store,
/// including initialization, data manipulation, and reactive data observation.
/// Implementations of this interface can be used to abstract various
/// storage backends (e.g., Hive, SharedPreferences, or custom solutions)
/// while providing a consistent API for the rest of the application.
///
/// Usage:
/// ```dart
/// class MyHiveImplementation extends KeyValueStore {
///   // Implementation details...
/// }
///
/// final store = MyHiveImplementation();
/// await store.init();
/// await store.put('key', 'value');
/// final value = await store.get('key');
/// store.watchKeys(['key']).listen((changes) {
///   print('Key changed: $changes');
/// });
/// ```
///
/// Note: All methods are asynchronous to accommodate potentially
/// time-consuming I/O operations.
/// {@endtemplate}
abstract class KeyValueStore {
  /// Initializes the key-value store.
  ///
  /// This method should be called before any other operations.
  /// It may set up connections, open files, or perform any other
  /// necessary setup steps.
  Future<void> init();

  /// Retrieves a value from the store.
  ///
  /// Returns the value associated with [key], or null if the key doesn't exist.
  /// The type [T] allows for type-safe retrieval of values.
  Future<T?> get<T>(final String key);

  /// Stores a value in the store.
  ///
  /// Associates the [value] with the given [key]. If the key already exists,
  /// its value is overwritten.
  Future<void> put<T>(final String key, final T value);

  /// Removes a value from the store.
  ///
  /// Deletes the entry associated with [key]. If the key doesn't exist,
  /// this operation should complete without error.
  Future<void> delete(final String key);

  /// Checks if a key exists in the store.
  ///
  /// Returns true if [key] exists in the store, false otherwise.
  Future<bool> containsKey(final String key);


  /// Returns all keys in the store
  Future<List<dynamic>> keys();

  /// Returns all they values in the store
  Future<List<dynamic>> values();

  /// Clears all data from the store.
  ///
  /// Removes all key-value pairs from the store, effectively resetting it.
  Future<void> clear();

  /// Closes the store.
  ///
  /// Performs any necessary cleanup operations, such as closing connections
  /// or flushing data to disk. The store should not be used after this method
  /// is called.
  Future<void> close();

  /// Streams values for one or more keys.
  ///
  /// Returns a stream that emits a map of the current values for the given [keys]
  /// whenever any of those keys change in the store. The emitted map contains
  /// entries for all specified keys, with null values for keys that don't exist.
  ///
  /// This method is useful for reactive programming patterns, allowing parts of
  /// your application to respond to changes in the store in real-time.
  Stream<Map<String, dynamic>> watchKeys(final List<String> keys);
}
