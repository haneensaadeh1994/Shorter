// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Link extends DataClass implements Insertable<Link> {
  final int? id;
  final String linkBefore;
  final String linkAfter;
  Link({ this.id, required this.linkBefore, required this.linkAfter});
  factory Link.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Link(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      linkBefore: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link_before'])!,
      linkAfter: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link_after'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id!);
    map['link_before'] = Variable<String>(linkBefore);
    map['link_after'] = Variable<String>(linkAfter);
    return map;
  }

  LinksCompanion toCompanion(bool nullToAbsent) {
    return LinksCompanion(
      id: Value(id!),
      linkBefore: Value(linkBefore),
      linkAfter: Value(linkAfter),
    );
  }

  factory Link.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Link(
      id: serializer.fromJson<int>(json['id']),
      linkBefore: serializer.fromJson<String>(json['linkBefore']),
      linkAfter: serializer.fromJson<String>(json['linkAfter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id!),
      'linkBefore': serializer.toJson<String>(linkBefore),
      'linkAfter': serializer.toJson<String>(linkAfter),
    };
  }

  Link copyWith({int? id, String? linkBefore, String? linkAfter}) => Link(
        id: id ?? this.id,
        linkBefore: linkBefore ?? this.linkBefore,
        linkAfter: linkAfter ?? this.linkAfter,
      );
  @override
  String toString() {
    return (StringBuffer('Link(')
          ..write('id: $id, ')
          ..write('linkBefore: $linkBefore, ')
          ..write('linkAfter: $linkAfter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(linkBefore.hashCode, linkAfter.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Link &&
          other.id == this.id &&
          other.linkBefore == this.linkBefore &&
          other.linkAfter == this.linkAfter);
}

class LinksCompanion extends UpdateCompanion<Link> {
  final Value<int> id;
  final Value<String> linkBefore;
  final Value<String> linkAfter;
  const LinksCompanion({
    this.id = const Value.absent(),
    this.linkBefore = const Value.absent(),
    this.linkAfter = const Value.absent(),
  });
  LinksCompanion.insert({
    this.id = const Value.absent(),
    required String linkBefore,
    required String linkAfter,
  })  : linkBefore = Value(linkBefore),
        linkAfter = Value(linkAfter);
  static Insertable<Link> custom({
    Expression<int>? id,
    Expression<String>? linkBefore,
    Expression<String>? linkAfter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (linkBefore != null) 'link_before': linkBefore,
      if (linkAfter != null) 'link_after': linkAfter,
    });
  }

  LinksCompanion copyWith(
      {Value<int>? id, Value<String>? linkBefore, Value<String>? linkAfter}) {
    return LinksCompanion(
      id: id ?? this.id,
      linkBefore: linkBefore ?? this.linkBefore,
      linkAfter: linkAfter ?? this.linkAfter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (linkBefore.present) {
      map['link_before'] = Variable<String>(linkBefore.value);
    }
    if (linkAfter.present) {
      map['link_after'] = Variable<String>(linkAfter.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinksCompanion(')
          ..write('id: $id, ')
          ..write('linkBefore: $linkBefore, ')
          ..write('linkAfter: $linkAfter')
          ..write(')'))
        .toString();
  }
}

class $LinksTable extends Links with TableInfo<$LinksTable, Link> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LinksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _linkBeforeMeta = const VerificationMeta('linkBefore');
  late final GeneratedColumn<String?> linkBefore = GeneratedColumn<String?>(
      'link_before', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _linkAfterMeta = const VerificationMeta('linkAfter');
  late final GeneratedColumn<String?> linkAfter = GeneratedColumn<String?>(
      'link_after', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, linkBefore, linkAfter];
  @override
  String get aliasedName => _alias ?? 'links';
  @override
  String get actualTableName => 'links';
  @override
  VerificationContext validateIntegrity(Insertable<Link> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('link_before')) {
      context.handle(
          _linkBeforeMeta,
          linkBefore.isAcceptableOrUnknown(
              data['link_before']!, _linkBeforeMeta));
    } else if (isInserting) {
      context.missing(_linkBeforeMeta);
    }
    if (data.containsKey('link_after')) {
      context.handle(_linkAfterMeta,
          linkAfter.isAcceptableOrUnknown(data['link_after']!, _linkAfterMeta));
    } else if (isInserting) {
      context.missing(_linkAfterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Link map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Link.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LinksTable createAlias(String alias) {
    return $LinksTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $LinksTable links = $LinksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [links];
}
