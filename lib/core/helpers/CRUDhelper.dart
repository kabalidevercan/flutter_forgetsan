import 'package:sqflite/sqflite.dart';

import '../models/things_model.dart';
import 'DBhelper.dart';

class CrudHelper {
  Future<List<Things>> getAllThings() async {
    var db = await DatabaseHelper().db;
    List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT * FROM things",
    );

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Things(
        id: satir["id"].toString(),
        title: satir["title"],
        description: satir["description"] ?? "",
        imgUrl: satir["imgUrl"] ?? "",
        isDone: satir["isDone"],
        dateTime: satir["dateTime"],
      );
    });
  }

  Future<void> insert(Things things) async {
    var db = await DatabaseHelper().db;
    var value = {
      'title': things.title,
      'description': things.description ?? "",
      'imgUrl': things.imgUrl ?? "",
      'isDone': things.isDone,
      'dateTime': things.dateTime.toString()
    };

    await db.insert('things', value,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(Things things) async {
    var db = await DatabaseHelper().db;

    var value = {
      'title': things.title,
      'description': things.description ?? "",
      'imgUrl': things.imgUrl ?? "",
      'isDone': things.isDone,
      'dateTime': things.dateTime.toString()
    };
    var yz = db.update('things', value, where: 'id=?', whereArgs: [things.id]);
  }

  Future<void> delete(Things things) async {
    var db = await DatabaseHelper().db;
    var yz = db.delete('things', where: 'id=?', whereArgs: [things.id]);
  }

  Future<void> closeReminder(Things things) async {
    var db = await DatabaseHelper().db;
    var value = {'isDone': 1};

    var yz = db.update('things', value, where: 'id=?', whereArgs: [things.id]);
  }
}
