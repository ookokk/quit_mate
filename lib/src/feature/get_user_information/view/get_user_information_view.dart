import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/get_user_information/view/addictive_factor_view.dart';
import 'package:quit_mate/src/feature/get_user_information/view/daily_use_on_days_view.dart';
import 'package:quit_mate/src/feature/get_user_information/view/sober_start_date_view.dart';
import 'package:quit_mate/src/feature/get_user_information/view/weekly_frequency_of_use.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/next_button.dart';
import 'package:quit_mate/src/product/widget/custom_app_bar.dart';

class GetUserInformationView extends ConsumerWidget {
  GetUserInformationView({
    Key? key,
  }) : super(key: key);
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: NextButton(
        onTap: () {
          if (_pageController.page != 3) {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          }
        },
        text: Strings.next,
      ),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: PageView(controller: _pageController, children: [
        const AddictiveFactorView(),
        SoberStartDateView(),
        const WeeklyFrequencyOfUseView(),
        const DailyUseOnDaysView(),
      ]),
    ));
  }
}
