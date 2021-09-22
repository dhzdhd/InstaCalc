import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DatabaseController {
  static late DatabaseFactory databaseFactory;
  static late Database db;

  static Future<void> init() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await databaseFactory.openDatabase('databases/history.db');

    await db.execute('''
    CREATE IF NOT EXISTS TABLE history (
      expr TEXT
      value TEXT
      date DATE
    )''');
  }

  static Future<void> insert() async {
    await db.insert('history', <String, Object?>{});
  }
}
