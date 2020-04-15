import 'package:projetomobile/repository/sql/ddl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class BaseRepository<T> {
  Database _db;

  final String _dbName = 'projeto_mobile.db';
  final int dbVersion = 12;

  String tableName;

  Future<List<T>> getAll();

  Future insert(T t);

  Future update(T t);

  Future delete(T t);

  Future<Database> get db async {
    if (_db == null) {
      var dbPath = await getDatabasesPath();
      dbPath = join(dbPath, _dbName);
      _db = await openDatabase(dbPath, version: dbVersion, onCreate: _onCreate, onUpgrade: _onUpgrade, onConfigure: _onConfigure);
    }
    return _db;
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = 1');
  }

  Future _onCreate(Database db, int version) async {
    await runDDLs(db);
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await runDROPs(db);
    await runDDLs(db);
  }

  Future runDDLs(Database db) async {
    await runSQLList(DDL_LIST, db);
  }

  Future runDROPs(Database db) async {
    await runSQLList(DROP_LIST, db);
  }

  Future runSQLList(List<String> list, Database db) async {
    list.forEach((ddl) async {
      print('Executando: ' + ddl);
      await db.execute(ddl);
    });
  }
}
