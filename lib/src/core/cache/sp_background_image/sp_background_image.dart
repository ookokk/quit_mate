import 'package:shared_preferences/shared_preferences.dart';

class SPBackgroundImage {
  Future<String?> getBackgroundImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('backgroundImage');
  }

  Future<void> setNewBackgroundImage(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('backgroundImage', imagePath);
  }
}
