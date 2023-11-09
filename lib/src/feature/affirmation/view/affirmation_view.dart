import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/generated/assets.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/affirmation/viewmodel/affirmation_viewmodel.dart';

class AffirmationView extends ConsumerWidget {
  final String? imagePath;
  AffirmationView({Key? key, this.imagePath}) : super(key: key);
  final viewModel = AffirmationViewModel();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            imagePath ?? Assets.imagesWp3,
            fit: BoxFit.cover,
            height: DeviceSize.kHeight(context),
            width: DeviceSize.kWidth(context),
          )
        ],
      ),
    ));
  }
}
