import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/custom_number_picker.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/next_button.dart';
import 'package:quit_mate/src/product/widget/custom_app_bar.dart';

class WeeklyFrequencyOfUseView extends ConsumerWidget {
  const WeeklyFrequencyOfUseView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: NextButton(onTap: () {}, text: Strings.next),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.howMany,
                style: currentTheme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const CustomNumberPicker()
          ],
        ),
      ),
    ));
  }
}
