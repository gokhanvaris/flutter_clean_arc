// lib/database/app_database.dart

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart';

class CacheEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get key => text().withLength(min: 1, max: 50)();
  BlobColumn get value => blob()();
  DateTimeColumn get timestamp => dateTime()();
}

@DriftDatabase(tables: [CacheEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertCacheEntry(CacheEntriesCompanion entry) =>
      into(cacheEntries).insert(entry);

  Future<CacheEntry?> getCacheEntryByKey(String key) =>
      (select(cacheEntries)..where((tbl) => tbl.key.equals(key)))
          .getSingleOrNull();

  Future<int> deleteCacheEntryByKey(String key) =>
      (delete(cacheEntries)..where((tbl) => tbl.key.equals(key))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}
