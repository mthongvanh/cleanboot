import 'package:flutter/foundation.dart';

import '../../../../cleanboot.dart';

/// {@macro DisplayNamesLocalDataSource}
class DisplayNamesLocalDataSourceImpl implements DisplayNamesLocalDataSource {
  final KeyValueStore _store;

  /// {@macro DisplayNamesLocalDataSource}
  DisplayNamesLocalDataSourceImpl(this._store);

  @override
  Future<void> init() async {
    await store.init();
  }

  @override
  Future<DisplayNameModel?> displayName(
    final String userIdentifier,
  ) async {
    final names = await _store.values();
    final found = names
        .where((final name) => (name as Map)['userUid'] == userIdentifier)
        .toList();
    if (found.isNotEmpty) {
      found.sort((final a, final b) {
        return ((b as Map)['createdOn'] as int)
            .compareTo((a as Map)['createdOn'] as int);
      });
    }

    final name = found.firstOrNull;
    return Future.value(
      name != null
          ? DisplayNameModel.fromJson(Map<String, dynamic>.from(name))
          : null,
    );
  }

  @override
  Future<List<DisplayNameModel>> displayNames({
    final List<String>? userIdentifiers,
    final bool active = true,
  }) async {
    final values = await _store.values();
    final cachedDisplayNames = values
        .map((final e) => DisplayNameModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    if (!active) {
      return cachedDisplayNames;
    } else {
      final displayNames = <String, DisplayNameModel>{};

      // only keep the newest display name for a userUid and if we have specified
      // userIdentifiers, only add display names whose userIdentifiers are in the list
      for (final displayName in cachedDisplayNames) {
        final current = displayNames[displayName.userUid];
        if (current == null) {
          displayNames[displayName.userUid] = displayName;
        } else {
          final model =
              current.createdOn > displayName.createdOn ? current : displayName;
          final isValidUser = userIdentifiers?.contains(model.userUid) ?? true;

          if (isValidUser) {
            displayNames[displayName.userUid] = model;
          }
        }
      }

      return Future.value(displayNames.values.toList());
    }
  }

  @override
  Future<void> saveDisplayNames(
    final List<DisplayNameModel> displayNames,
  ) async {
    for (final displayName in displayNames) {
      final existingRecord =
          await _store.get<Map<dynamic, dynamic>>(displayName.identifier);
      if (existingRecord == null) {
        await store.put(
          displayName.identifier,
          displayName.toJson(),
        );
      } else {
        debugPrint('record already exists $displayName');
      }
    }
  }

  @override
  KeyValueStore get store => _store;
}
