import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static const String themeKey = 'theme';

  static Future<void> setTheme(String themeName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeKey, themeName);
  }

  static Future<String> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(themeKey) ?? "lightTheme";
  }
}
