import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/auth/service/auth_manager.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/view/sober_chart.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/widget/sober_start_page_view.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/widget/streak_view.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/widget/years_view.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SoberPageView extends ConsumerWidget {
  SoberPageView({
    Key? key,
  }) : super(key: key);
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final AuthManager authManager = AuthManager();
    return SizedBox(
      height: DeviceSize.kHeight(context) * 0.48,
      child: Container(
        color: currentTheme.hoverColor,
        child: Column(
          children: [
            Expanded(
              flex: 15,
              child: PageView(
                controller: _pageController,
                children: const [
                  SoberChart(),
                  StreakView(),
                  YearsView(),
                  SoberStartPageView()
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: DeviceSize.kHeight(context) * 0.01,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 4,
                  effect: const SlideEffect(
                      activeDotColor: Colors.yellow,
                      paintStyle: PaintingStyle.stroke,
                      dotHeight: 8,
                      dotWidth: 8),
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  final SoberUser user = SoberUser();
                  //   print(user.addictiveFactor);
                  print(user.soberStartDate);
                  print(user.userName);
                  print(user.dailyUseOnDays);
                  final UserRepository userRepository = UserRepository();
                  final String? currentUserId = authManager.getCurrentUserId();
                  //  final String mamed = await authManager.;
                  print(currentUserId);
                  //  final ahmet = await userRepository.getUser(currentUserId!);

                  await userRepository.saveUser(user);

                  //  print(ahmet?.userId);
                },
                child: Text(
                  'oskl',
                  style: currentTheme.textTheme.headlineLarge
                      ?.copyWith(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
