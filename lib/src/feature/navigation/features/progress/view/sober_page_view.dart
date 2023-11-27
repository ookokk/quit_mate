import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/view/sober_chart.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/widget/sober_start_page_view.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/widget/streak_view.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/widget/years_view.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SoberPageView extends ConsumerWidget {
  SoberPageView({
    Key? key,
  }) : super(key: key);
  final PageController _pageController = PageController();
  final SoberUser soberUser = SoberUser();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SizedBox(
      height: DeviceSize.kHeight(context) * 0.48,
      child: Container(
        color: currentTheme.hoverColor,
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  final bool ahmet = await CacheManager.getBool('isFirst');
                  print(ahmet);
                },
                child: Text(
                  'press',
                  style: currentTheme.textTheme.titleMedium,
                )),
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
          ],
        ),
      ),
    );
  }
}
