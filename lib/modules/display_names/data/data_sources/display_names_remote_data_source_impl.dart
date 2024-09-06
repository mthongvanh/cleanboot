import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/domain.dart';
import '../models/display_name_model.dart';

/// {@macro DisplayNamesRemoteDataSource}
class DisplayNamesRemoteDataSourceImpl extends DisplayNamesRemoteDataSource {
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  CollectionReference get _collection => _firestore.collection('displayNames');

  final _controller = StreamController<List<DisplayNameModel>>.broadcast();
  StreamSubscription<QuerySnapshot<Object?>>? _subscription;

  @override
  Future<void> init() async {
    debugPrint('init called');
  }

  @override
  Future<DisplayNameModel> displayName(final String userIdentifier) async {
    try {
      final results = await _collection
          .where('userUid', isEqualTo: userIdentifier)
          .orderBy(
            'createdOn',
            descending: true,
          )
          .limit(1)
          .get();
      if (results.docs.isNotEmpty) {
        return _modelFromFirebase(
          results.docs.first as QueryDocumentSnapshot<Map<String, dynamic>>,
        );
      } else {
        throw Exception('Display name not found');
      }
    } catch (e, stack) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stack);
      rethrow;
    }
  }

  DisplayNameModel _modelFromFirebase(
    final DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data() ?? {};
    data['identifier'] = snapshot.id;
    if (data['createdOn'] is Timestamp) {
      data['createdOn'] =
          (data['createdOn'] as Timestamp).millisecondsSinceEpoch;
    }
    return DisplayNameModel.fromJson(data);
  }

  @override
  Future<List<DisplayNameModel>> displayNames([
    final List<String>? userIdentifiers,
  ]) async {
    try {
      final result = await _collection.get();
      final displayNames = <DisplayNameModel>[];
      for (final snap in result.docs) {
        final model = _modelFromFirebase(
          snap as DocumentSnapshot<Map<String, dynamic>>,
        );
        displayNames.add(model);
      }
      return displayNames;
    } catch (e, stack) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stack);
      rethrow;
    }
  }

  @override
  Future<void> saveDisplayNames(final List<Map<String, Object>> displayNames) {
    // TODO: implement saveDisplayNames
    throw UnimplementedError();
  }

  @override
  Future<Stream<List<DisplayNameModel>>> streamDisplayNames([
    final int? newerThan,
  ]) async {
    Query query;
    if (newerThan != null) {
      query = _collection.where(
        'createdOn',
        isGreaterThan: newerThan,
      );
    } else {
      query = _collection;
    }

    await _subscription?.cancel();
    _subscription = query.snapshots().listen((final docs) {
      final added = docs.docChanges
          .where(
            (final DocumentChange change) =>
                change.type == DocumentChangeType.added,
          )
          .toList();
      if (added.isNotEmpty) {
        final models = added
            .map(
              (final e) => _modelFromFirebase(
                e.doc as DocumentSnapshot<Map<String, dynamic>>,
              ),
            )
            .toList();

        _controller.sink.add(models);
      }
    });
    return _controller.stream;
  }
}
