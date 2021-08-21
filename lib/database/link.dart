import 'package:moor_flutter/moor_flutter.dart';

part 'link.g.dart';

class Links extends Table {

  IntColumn get id => integer().autoIncrement()();

  TextColumn get linkBefore => text()();

  TextColumn get linkAfter => text()();

  @override
  // TODO: implement primaryKey
  Set<Column>? get primaryKey => {id};

}

@UseMoor(tables: [Links])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", logStatements: true));

  int get schemaVersion => 1;

  Future<List<Link>> getAllLinks() => select(links).get();

  Stream<List<Link>> watchAllLinks() => select(links).watch();

  Future insertNewLink(Link link) => into(links).insert(link);

  Future deleteLink(Link link) => delete(links).delete(link);
}


