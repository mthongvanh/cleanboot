import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../../modules.dart';

/// {@template DisplayNamesRepositoryImpl}
/// Extends [DisplayNamesRepository] base class
///
/// {@macro DisplayNamesRepository}
/// {@endtemplate}
class DisplayNamesRepositoryImpl extends DisplayNamesRepository {
  /// Provides access to local display names data sources
  final DisplayNamesLocalDataSource localDataSource;

  /// Provides access to remote display names data sources
  final DisplayNamesRemoteDataSource remoteDataSource;

  StreamSubscription<List<DisplayNameModel>>? _displayNameSubscription;

  /// {@macro DisplayNamesRepositoryImpl}
  DisplayNamesRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<void> subscribeDisplayNames() async {
    await _displayNameSubscription?.cancel();
    final displayNames = await localDataSource.displayNames(active: false);
    int? newest;
    for (final DisplayNameModel name in displayNames) {
      if (name.createdOn > (newest ?? 0)) {
        newest = name.createdOn;
      }
    }
    final stream = await remoteDataSource.streamDisplayNames(newest);
    _displayNameSubscription = stream.listen(localDataSource.saveDisplayNames);
  }

  @override
  Future<List<DisplayName>> getDisplayNames(
    final GetDisplayNamesParams params,
  ) async {
    // check local cache, which should always be updated if subscribeDisplayNames
    // has been called
    final cachedDisplayNames = await localDataSource.displayNames();
    if (cachedDisplayNames.isNotEmpty) {
      return cachedDisplayNames.map((final model) => model.toEntity).toList();
    } else {
      final fetchedDisplayNames = await remoteDataSource.displayNames();
      return fetchedDisplayNames.map((final model) => model.toEntity).toList();
    }
  }

  @override
  Future<bool> displayNameExists(
    final DisplayNameExistsParams params,
  ) async {
    bool exists = false;
    try {
      List<DisplayNameModel> displayNames = await localDataSource.displayNames(
        active: false,
      );
      if (displayNames.isEmpty) {
        final cached = await localDataSource.displayNames();
        if (cached.isEmpty) {
          debugPrint('no cached display names exists, so fetching them');
          // since we don't have any cached display names, we need to hydrate the
          // cache. fetch from the remote data source and save locally
          displayNames = await remoteDataSource.displayNames();
          await localDataSource.saveDisplayNames(displayNames.toList());
        }
      }
      final found = displayNames.firstWhere(
        (final e) =>
            e.displayName.toLowerCase() == params.displayName.toLowerCase(),
      );
      debugPrint('found display name: $found');
      exists = true;
    } catch (e) {
      debugPrint('did not find the display name: $e');
    }
    return exists;
  }

  @override
  Future<Map<String, DisplayName>?> getActiveDisplayNames() async {
    List<DisplayNameModel> displayNames = await localDataSource.displayNames();
    if (displayNames.isEmpty) {
      displayNames = await remoteDataSource.displayNames();
    }
    final entries = displayNames.map(
      (final v) => MapEntry(v.userUid, v.toEntity),
    );
    return Map.fromEntries(entries);
  }

  @override
  Future<DisplayName?> getDisplayName(final String userIdentifier) async {
    DisplayNameModel? cached =
        await localDataSource.displayName(userIdentifier);
    // if no item is found, check to see if our local data source is empty.
    // if it is empty, hydrate the cache and check again
    if (cached == null) {
      final cachedDisplayNames = await localDataSource.displayNames();
      if (cachedDisplayNames.isEmpty) {
        final displayNames = await remoteDataSource.displayNames();
        await localDataSource.saveDisplayNames(displayNames.toList());
        cached = await localDataSource.displayName(userIdentifier);
      }
    }
    return cached?.toEntity;
  }
}
