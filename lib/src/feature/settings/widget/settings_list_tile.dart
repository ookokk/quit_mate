import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class SettingsListTile extends ConsumerStatefulWidget {
  final String text;
  final Widget trailingChild;
  final VoidCallback? onTap;
  const SettingsListTile(
      {Key? key, required this.text, this.onTap, required this.trailingChild})
      : super(key: key);

  @override
  ConsumerState createState() => _SettingsListTileState();
}

class _SettingsListTileState extends ConsumerState<SettingsListTile> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return Container(
      height: 50,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 1))
          ],
          shape: BoxShape.rectangle,
          color: currentTheme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: widget.onTap,
        tileColor: currentTheme.scaffoldBackgroundColor,
        title: Text(
          widget.text,
          style: currentTheme.textTheme.titleMedium,
        ),
        trailing: widget.trailingChild,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              style: BorderStyle.solid,
              color: currentTheme.indicatorColor,
              width: 0.01),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
