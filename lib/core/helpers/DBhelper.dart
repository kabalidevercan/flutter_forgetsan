import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }

  initDb() async {
    var dbfolder = await getDatabasesPath();
    String path = join(dbfolder, 'forgetsan.db');
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE "things" ("id"	INTEGER,"title"	TEXT,"description"	TEXT,"imgUrl"	TEXT,"isDone"	INTEGER,"dateTime"	TEXT,PRIMARY KEY("id" AUTOINCREMENT))');
  }
}
