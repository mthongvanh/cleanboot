import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core.dart';

/// {@macro KeyValueStore}
class HiveKeyValueStore implements KeyValueStore {
  late Box<dynamic> _box;
  final String _boxName;
  final Map<String, StreamController<Map<String, dynamic>>> _controllers = {};

  /// {@macro KeyValueStore}
  HiveKeyValueStore(this._boxName);

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
    _box.watch().listen(_onBoxChanged);
  }

  @override
  Future<T?> get<T>(final String key) async {
    return _box.get(key) as T?;
  }

  @override
  Future<void> put<T>(final String key, final T value) async {
    await _box.put(key, value);
  }

  @override
  Future<void> delete(final String key) async {
    await _box.delete(key);
  }

  @override
  Future<bool> containsKey(final String key) async {
    return _box.containsKey(key);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  Future<void> close() async {
    await _box.close();
    for (final controller in _controllers.values) {
      await controller.close();
    }
    _controllers.clear();
  }

  @override
  Stream<Map<String, dynamic>> watchKeys(final List<String> keys) {
    final controller = StreamController<Map<String, dynamic>>.broadcast();
    _controllers[keys.join(',')] = controller;

    // Initial emit
    _emitChanges(controller, keys);

    return controller.stream;
  }

  void _onBoxChanged(final BoxEvent event) {
    _controllers.forEach((final keyString, final controller) {
      final keys = keyString.split(',');
      if (keys.contains(event.key)) {
        _emitChanges(controller, keys);
      }
    });
  }

  void _emitChanges(
    final StreamController<Map<String, dynamic>> controller,
    final List<String> keys,
  ) {
    if (!controller.isClosed) {
      controller.add(
        Map.fromEntries(
          keys.map((final key) => MapEntry(key, _box.get(key))),
        ),
      );
    }
  }

  @override
  Future<List<dynamic>> keys() {
    return Future.value(_box.keys.toList());
  }

  @override
  Future<List<dynamic>> values() {
    return Future.value(_box.values.toList());
  }
}
