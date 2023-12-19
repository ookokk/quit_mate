import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class SettingsCategoryRow extends ConsumerStatefulWidget {
  final String headerText;
  final IconData iconData;
  const SettingsCategoryRow({
    super.key,
    required this.headerText,
    required this.iconData,
  });

  @override
  ConsumerState createState() => _SettingsCategoryRowState();
}

class _SettingsCategoryRowState extends ConsumerState<SettingsCategoryRow> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            widget.iconData,
            color: currentTheme.indicatorColor,
            size: 25,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            widget.headerText,
            style: currentTheme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
