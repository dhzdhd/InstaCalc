import 'package:shared_preferences/shared_preferences.dart';

class MapData {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> storeThemeData(String theme) async {
    await _prefs.setString('theme', theme);
  }

  static String getThemeData() {
    final theme = _prefs.getString('theme') ?? 'light';
    return theme;
  }
}
