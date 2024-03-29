import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/splash/splash/viewmodel/splash_state_mixin.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  ConsumerState createState() => SplashViewState();
}

class SplashViewState extends ConsumerState<SplashView> with SplashStateMixin {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: DeviceSize.kHeight(context) * 0.2,
              child: Lottie.asset('assets/animations/circular.json',
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    ));
  }
}
