import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  //Theme key = "theme"
  //Is first key = "isFirst"
  //Token key = "token"
  static Future<void> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key,
      {String defaultValue = ""}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defaultValue;
  }

  static Future<void> removeString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<void> getBool(String key, {bool defaultValue = true}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool(key);
  }

  static Future<void> removeBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
