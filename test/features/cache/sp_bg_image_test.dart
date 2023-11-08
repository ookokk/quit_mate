/*
import 'package:flutter_test/flutter_test.dart';
import 'package:quit_mate/src/core/cache/sp_background_image/sp_background_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('SPBackgroundImage', () {
    test('setNewBackgroundImage should set the background image', () async {
      final spBackgroundImage = SPBackgroundImage();
      final testImagePath = 'test_image.jpg';

      await spBackgroundImage.setNewBackgroundImage(testImagePath);

      final prefs = await SharedPreferences.getInstance();
      final backgroundImage = prefs.getString('backgroundImage');

      expect(backgroundImage, testImagePath);
    });

    test('getBackgroundImage should return the set background image', () async {
      final spBackgroundImage = SPBackgroundImage();
      final testImagePath = 'test_image.jpg';

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('backgroundImage', testImagePath);

      final backgroundImage = await spBackgroundImage.getBackgroundImage();

      expect(backgroundImage, testImagePath);
    });

    test('getBackgroundImage should return null if background image is not set',
        () async {
      final spBackgroundImage = SPBackgroundImage();

      final backgroundImage = await spBackgroundImage.getBackgroundImage();

      expect(backgroundImage, isNull);
    });
  });
}
*/
