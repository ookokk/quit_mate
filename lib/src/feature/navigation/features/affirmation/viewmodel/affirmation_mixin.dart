import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/cache/sp_background_image/sp_background_image.dart';
import 'package:quit_mate/src/feature/navigation/features/affirmation/model/get_random_affirmation.dart';
import 'package:quit_mate/src/feature/navigation/features/affirmation/view/affirmation_view.dart';

mixin AffirmationMixin on ConsumerState<AffirmationView> {
  late String dailyAffirmation;
  late GetRandomAffirmation randomAffirmationGenerator;
  final sharedBGManager = SPBackgroundImage();
  late String? bgImagePath;

  @override
  void initState() {
    super.initState();
    initBackgroundImage();
    loadDailyAffirmation();
  }

  Future<void> initBackgroundImage() async {
    bgImagePath = await sharedBGManager.getBackgroundImage();
    setState(() {});
  }

  void loadDailyAffirmation() {
    randomAffirmationGenerator = GetRandomAffirmation();
    dailyAffirmation = randomAffirmationGenerator.getRandomAffirmation();
  }
}
