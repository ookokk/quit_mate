import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/navigation/features/affirmation/view/affirmation_view.dart';
import 'package:quit_mate/src/feature/navigation/features/home/view/home_view.dart';
import 'package:quit_mate/src/feature/navigation/widget/navigation_app_bar.dart';
import 'package:quit_mate/src/feature/settings/view/settings_view.dart';
import 'package:quit_mate/src/product/widget/custom_nav_bar.dart';

class NavigationView extends ConsumerStatefulWidget {
  const NavigationView({
    super.key,
  });

  @override
  NavigationViewState createState() => NavigationViewState();
}

class NavigationViewState extends ConsumerState<NavigationView> {
  int selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
        appBar: const NavigationAppBar(),
        resizeToAvoidBottomInset: false,
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: PageView(controller: _pageController, children: const [
          HomeView(),
          AffirmationView(),
          SettingsView(),
        ]),
        bottomNavigationBar: CustomNavBar(
          selectedIndex: selectedIndex,
          onItemTapped: onItemTapped,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
