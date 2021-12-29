import 'package:sqflite/sqflite.dart';

class DatabaseController {
  static late Database database;
  static late List historyList;

  static Future<void> init() async {
    database = await openDatabase('history.db', version: 1,
        onConfigure: (Database db) async {
      try {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS history (curdate TEXT PRIMARY KEY, expr TEXT, res TEXT, type TEXT)',
        );
      } catch (err) {
        print(err);
      }
    });

    historyList = await fetch();
  }

  static Future<List<Map>> fetch() async {
    var rows = await database.rawQuery('SELECT * FROM history');
    return rows;
  }

  static Future<List<Map>> fetchRow({required String where}) async {
    return await database.query('history', where: where);
  }

  static Future<void> delete() async {
    await database.delete('history');
  }

  static Future<void> insert(
      {required String expr, required String res, required String type}) async {
    var date = DateTime.now();
    var dateString = '${date.year}-${date.month}-${date.day}';
    late String newExpr;
    late String newRes;
    late String newType;

    var result = await fetch();

    if (result.isNotEmpty) {
      var row = {};
      result.forEach((element) {
        if (element['curdate'] == dateString) {
          row = element;
        }
      });

      newExpr = "${row['expr']} ${expr.trim()}";
      newRes = "${row['res']} ${res.trim()}";
      newType = "${row['type']} ${type.trim()}";

      await database.rawUpdate(
          'UPDATE history SET expr=?, res=?, type=? WHERE curdate=?',
          [newExpr, newRes, newType, dateString]);
    } else {
      newExpr = expr.trim();
      newRes = res.trim();
      newType = type.trim();

      await database.insert('history', {
        'curdate': dateString,
        'expr': newExpr,
        'res': newRes,
        'type': newType
      });
    }
  }
}
