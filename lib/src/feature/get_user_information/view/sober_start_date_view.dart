// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/next_button.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/sober_start_date_row.dart';
import 'package:quit_mate/src/product/widget/custom_app_bar.dart';

class SoberStartDateView extends ConsumerWidget {
  SoberStartDateView({
    Key? key,
  }) : super(key: key);
  DateTime? selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: NextButton(
        text: Strings.next,
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                Strings.whenWas,
                style: currentTheme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SoberStartDateRow()
          ],
        ),
      ),
    ));
  }
}
