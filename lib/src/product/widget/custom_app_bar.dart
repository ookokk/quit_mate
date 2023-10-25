import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const CustomAppBar({
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
          style: currentTheme.textTheme.displaySmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: currentTheme.hoverColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: currentTheme.indicatorColor,
            )));
  }
}