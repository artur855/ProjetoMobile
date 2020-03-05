

import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
abstract class BaseRepository {

  static Database _db;

  get db async {
    if (_db == null){
      var paths = await getDatabasesPath();
      var dbPath = join(paths, 'projetomobile.db');
      var dbExists = await databaseExists(dbPath);
      if (!dbExists){
        await Directory(dirname(dbPath)).create(recursive: true);
      }
      _db = await openDatabase(dbPath);
    }
    return _db;
  }


}
