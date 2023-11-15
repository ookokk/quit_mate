import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const HomeAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return AppBar(
      centerTitle: true,
      title: Text(
        title ?? "",
        style: currentTheme.textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      elevation: 0,
      actions: [
        Expanded(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              color: currentTheme.indicatorColor,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: SvgPicture.asset('assets/svg/appbar.svg'),
        ),
        Expanded(
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(
                Icons.person_sharp,
                color: currentTheme.indicatorColor,
              )),
        )
      ],
      backgroundColor: currentTheme.scaffoldBackgroundColor,
    );
  }
}
