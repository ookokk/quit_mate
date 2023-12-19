import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class CustomNavBar extends ConsumerWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  const CustomNavBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return BottomNavigationBar(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      elevation: 2,
      selectedFontSize: 18,
      selectedLabelStyle: currentTheme.textTheme.bodySmall,
      unselectedLabelStyle: currentTheme.textTheme.bodySmall,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentTheme.indicatorColor,
          ),
          label: "home".tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.support,
            color: currentTheme.indicatorColor,
          ),
          label: "motivation".tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings_outlined,
            color: currentTheme.indicatorColor,
          ),
          label: "settings".tr(),
        ),
      ],
    );
  }
}
