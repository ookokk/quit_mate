import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class NavigationAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const NavigationAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return AppBar(
      foregroundColor: currentTheme.hoverColor,
      centerTitle: true,
      title: Text(
        title ?? "",
        style: currentTheme.textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      elevation: 0,
      actions: [
        Expanded(
          flex: 6,
          child: SvgPicture.asset('assets/svg/appbar.svg'),
        ),
      ],
      backgroundColor: currentTheme.hoverColor,
    );
  }
}
