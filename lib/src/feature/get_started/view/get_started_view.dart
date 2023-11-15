import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/feature/get_started/widget/get_started_button.dart';
import '../../../core/theme/theme_provider.dart';

class GetStartedView extends ConsumerWidget {
  const GetStartedView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      floatingActionButton: GetStartedButton(
        text: Strings.getStarted,
        onTap: () {
          Navigator.pushReplacementNamed(context, '/getUserInfo');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              Strings.firstOfAll,
              style: currentTheme.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              Strings.takeTheFirst,
              style: currentTheme.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            SvgPicture.asset(
              'assets/svg/get_started3.svg',
              height: DeviceSize.kHeight(context) * 0.6,
            ),
          ],
        ),
      ),
    ));
  }
}
