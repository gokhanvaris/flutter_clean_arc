import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_clean_arc/product/core/cache/app_database.dart';
import 'package:flutter_clean_arc/product/utility/models/res/user_model.dart';

class CacheManager<T> {
  final AppDatabase _database;

  CacheManager(this._database);

  Future<void> cacheData(String key, T value) async {
    final bytes = _toBytes(value);
    final existingEntry = await _database.getCacheEntryByKey(key);
    if (existingEntry != null) {
      await _database.deleteCacheEntryByKey(key);
    }
    await _database.insertCacheEntry(
      CacheEntriesCompanion(
        key: Value(key),
        value: Value(bytes),
        timestamp: Value(DateTime.now()),
      ),
    );
  }

  Future<T?> getCachedData(String key, T Function(Uint8List) fromBytes) async {
    final entry = await _database.getCacheEntryByKey(key);
    if (entry?.value != null) {
      return fromBytes(entry!.value);
    }
    return null;
  }

  Future<void> removeCachedData(String key) async {
    await _database.deleteCacheEntryByKey(key);
  }

  Uint8List _toBytes(T value) {
    if (value is User) {
      return Uint8List.fromList(utf8.encode(jsonEncode(value.toJson())));
    }
    throw UnsupportedError('Type not supported');
  }
}
