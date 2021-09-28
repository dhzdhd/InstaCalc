import 'package:shared_preferences/shared_preferences.dart';

class DatabaseController {
  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> view() async {}

  static Future<void> insert(String expr, String value, DateTime date) async {
    prefs.setStringList('${date.toString()}', []);
  }
}
