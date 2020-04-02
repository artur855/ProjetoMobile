import 'package:projetomobile/repository/sql/ddl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class BaseRepository {
  Database _db;

  final String _dbName = 'projeto_mobile.db';
  final int dbVersion = 1;

  Future<Database> get db async {
    if (_db == null) {
      var dbPath = await getDatabasesPath();
      dbPath = join(dbPath, _dbName);
      _db = await openDatabase(dbPath, version: dbVersion, onCreate:_onCreate);
    }
    return _db;
  }

  Future _onCreate(Database db, int version) async {
    DDL_LIST.forEach((ddl) async {
      await db.execute(ddl);
    });
  }
}
