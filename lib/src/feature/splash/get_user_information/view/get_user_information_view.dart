import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/view/addictive_factor_view.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/view/set_daily_notifications_view.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/view/sober_start_date_view.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/view/weekly_frequency_of_use_view.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/next_button.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';
import 'package:quit_mate/src/product/widget/custom_app_bar.dart';

import 'daily_use_on_days_view.dart';

class GetUserInformationView extends ConsumerWidget {
  GetUserInformationView({
    Key? key,
  }) : super(key: key);
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRepository = UserRepository();
    final SoberUser soberUser = SoberUser();
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: NextButton(
        onTap: () async {
          if (_pageController.page != 4) {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          } else {
            /* Navigator.pushNamedAndRemoveUntil(
                context, '/navigation', (route) => false);*/
            CacheManager.setBool('isFirst', false);
            String? currentID = await CacheManager.getString('userId');

            //  userRepository.saveUser(soberUser, currentID ?? "");
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
        const SetDailyNotificationsView(),
      ]),
    ));
  }
}
