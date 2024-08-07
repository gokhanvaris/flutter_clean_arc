// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CacheEntriesTable extends CacheEntries
    with TableInfo<$CacheEntriesTable, CacheEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CacheEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<Uint8List> value = GeneratedColumn<Uint8List>(
      'value', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, key, value, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cache_entries';
  @override
  VerificationContext validateIntegrity(Insertable<CacheEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CacheEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CacheEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}value'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $CacheEntriesTable createAlias(String alias) {
    return $CacheEntriesTable(attachedDatabase, alias);
  }
}

class CacheEntry extends DataClass implements Insertable<CacheEntry> {
  final int id;
  final String key;
  final Uint8List value;
  final DateTime timestamp;
  const CacheEntry(
      {required this.id,
      required this.key,
      required this.value,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<Uint8List>(value);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  CacheEntriesCompanion toCompanion(bool nullToAbsent) {
    return CacheEntriesCompanion(
      id: Value(id),
      key: Value(key),
      value: Value(value),
      timestamp: Value(timestamp),
    );
  }

  factory CacheEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CacheEntry(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<Uint8List>(json['value']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<Uint8List>(value),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  CacheEntry copyWith(
          {int? id, String? key, Uint8List? value, DateTime? timestamp}) =>
      CacheEntry(
        id: id ?? this.id,
        key: key ?? this.key,
        value: value ?? this.value,
        timestamp: timestamp ?? this.timestamp,
      );
  CacheEntry copyWithCompanion(CacheEntriesCompanion data) {
    return CacheEntry(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CacheEntry(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, key, $driftBlobEquality.hash(value), timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CacheEntry &&
          other.id == this.id &&
          other.key == this.key &&
          $driftBlobEquality.equals(other.value, this.value) &&
          other.timestamp == this.timestamp);
}

class CacheEntriesCompanion extends UpdateCompanion<CacheEntry> {
  final Value<int> id;
  final Value<String> key;
  final Value<Uint8List> value;
  final Value<DateTime> timestamp;
  const CacheEntriesCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  CacheEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    required Uint8List value,
    required DateTime timestamp,
  })  : key = Value(key),
        value = Value(value),
        timestamp = Value(timestamp);
  static Insertable<CacheEntry> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<Uint8List>? value,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  CacheEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? key,
      Value<Uint8List>? value,
      Value<DateTime>? timestamp}) {
    return CacheEntriesCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      value: value ?? this.value,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<Uint8List>(value.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CacheEntriesCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CacheEntriesTable cacheEntries = $CacheEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cacheEntries];
}

typedef $$CacheEntriesTableCreateCompanionBuilder = CacheEntriesCompanion
    Function({
  Value<int> id,
  required String key,
  required Uint8List value,
  required DateTime timestamp,
});
typedef $$CacheEntriesTableUpdateCompanionBuilder = CacheEntriesCompanion
    Function({
  Value<int> id,
  Value<String> key,
  Value<Uint8List> value,
  Value<DateTime> timestamp,
});

class $$CacheEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CacheEntriesTable,
    CacheEntry,
    $$CacheEntriesTableFilterComposer,
    $$CacheEntriesTableOrderingComposer,
    $$CacheEntriesTableCreateCompanionBuilder,
    $$CacheEntriesTableUpdateCompanionBuilder> {
  $$CacheEntriesTableTableManager(_$AppDatabase db, $CacheEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CacheEntriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CacheEntriesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> key = const Value.absent(),
            Value<Uint8List> value = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              CacheEntriesCompanion(
            id: id,
            key: key,
            value: value,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String key,
            required Uint8List value,
            required DateTime timestamp,
          }) =>
              CacheEntriesCompanion.insert(
            id: id,
            key: key,
            value: value,
            timestamp: timestamp,
          ),
        ));
}

class $$CacheEntriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CacheEntriesTable> {
  $$CacheEntriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get key => $state.composableBuilder(
      column: $state.table.key,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CacheEntriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CacheEntriesTable> {
  $$CacheEntriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get key => $state.composableBuilder(
      column: $state.table.key,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CacheEntriesTableTableManager get cacheEntries =>
      $$CacheEntriesTableTableManager(_db, _db.cacheEntries);
}
