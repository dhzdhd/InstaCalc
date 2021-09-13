import 'package:shared_preferences/shared_preferences.dart';

class MapData {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> storeData(
      {required String key, required String value}) async {
    await _prefs.setString(key, value);
  }

  static String getData({required String key}) {
    final theme = _prefs.getString(key) ?? '';
    return theme;
  }

  static void removeData() async {
    await _prefs.clear();
  }
}
