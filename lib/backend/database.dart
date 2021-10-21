import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController {
  static late Database database;

  static Future<void> init() async {
    database = await openDatabase('history.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE history (expr TEXT, res TEXT, type TEXT, curdate DATE)',
      );
    });

    await insert(expr: 'expr', res: 'res', type: 'type');
  }

  static Future<void> view() async {}

  static Future<void> insert(
      {required String expr, required String res, required String type}) async {
    var date = DateTime.now();

    await database.insert('history', {
      'expr': expr,
      'res': res,
      'type': type,
      'curdate': '${date.year}-${date.month}-${date.day}'
    });
  }
}
