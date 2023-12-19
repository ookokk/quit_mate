import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/navigation/features/affirmation/viewmodel/affirmation_notifier.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/widget/sober_start_page_view.dart';
import 'package:quit_mate/src/feature/navigation/features/set_bg_image/viewmodel/bg_image_notifier.dart';

class AffirmationView extends ConsumerStatefulWidget {
  const AffirmationView({
    super.key,
  });

  @override
  AffirmationViewState createState() => AffirmationViewState();
}

class AffirmationViewState extends ConsumerState<AffirmationView> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final bgProvider = ref.watch(bgImageProvider);
    final affirmationNotifier = ref.watch(affirmationProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              bgProvider.bgImagePath,
              fit: BoxFit.cover,
              height: DeviceSize.kHeight(context),
              width: DeviceSize.kWidth(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, right: 15, left: 15),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  const SoberStartPageView().formatDate(DateTime.now()),
                  style: currentTheme.textTheme.titleLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100, right: 15, left: 15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  affirmationNotifier.dailyAffirmation,
                  style: currentTheme.textTheme.titleLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
