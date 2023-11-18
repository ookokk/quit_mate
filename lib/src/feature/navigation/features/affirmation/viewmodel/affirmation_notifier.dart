import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/feature/navigation/features/affirmation/model/get_random_affirmation.dart';

class AffirmationNotifier extends ChangeNotifier {
  String dailyAffirmation = '';
  GetRandomAffirmation randomAffirmationGenerator = GetRandomAffirmation();

  AffirmationNotifier() {
    loadDailyAffirmation();
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
