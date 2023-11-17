import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/generated/assets.dart';
import 'package:quit_mate/src/core/cache/sp_background_image/sp_background_image.dart';
import 'package:quit_mate/src/feature/navigation/features/affirmation/model/get_random_affirmation.dart';

class AffirmationNotifier extends ChangeNotifier {
  String dailyAffirmation = '';
  GetRandomAffirmation randomAffirmationGenerator = GetRandomAffirmation();
  final sharedBGManager = SPBackgroundImage();
  String _bgImagePath = Assets.imagesWp8;

  String get bgImagePath => _bgImagePath;

  AffirmationNotifier() {
    initBackgroundImage();
    loadDailyAffirmation();
  }

  Future<void> initBackgroundImage() async {
    _bgImagePath =
        (await sharedBGManager.getBackgroundImage()) ?? Assets.imagesWp8;
    notifyListeners();
  }

  void loadDailyAffirmation() {
    dailyAffirmation = randomAffirmationGenerator.getRandomAffirmation();
    notifyListeners();
  }
}

final affirmationProvider = ChangeNotifierProvider<AffirmationNotifier>((ref) {
  final provider = AffirmationNotifier();
  return provider;
});
