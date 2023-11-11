import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/generated/assets.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/affirmation/viewmodel/affirmation_mixin.dart';

class AffirmationView extends ConsumerStatefulWidget {
  const AffirmationView({
    Key? key,
  }) : super(key: key);

  @override
  AffirmationViewState createState() => AffirmationViewState();
}

class AffirmationViewState extends ConsumerState<AffirmationView>
    with AffirmationMixin {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              bgImagePath ?? Assets.imagesWp10,
              fit: BoxFit.cover,
              height: DeviceSize.kHeight(context),
              width: DeviceSize.kWidth(context),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100, right: 15, left: 15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  dailyAffirmation,
                  style: currentTheme.textTheme.headlineSmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
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
