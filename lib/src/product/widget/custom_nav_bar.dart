import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class CustomNavBar extends ConsumerWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  const CustomNavBar({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

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
            Icons.home_filled,
            color: currentTheme.indicatorColor,
          ),
          label: Strings.home,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/support.png',
            height: 27,
          ),
          label: Strings.motivation,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings_outlined,
            color: currentTheme.indicatorColor,
          ),
          label: Strings.settings,
        ),
      ],
    );
  }
}
