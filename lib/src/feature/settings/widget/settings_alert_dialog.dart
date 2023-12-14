import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class SettingsAlertDialog {
  Future<void> showSettingsAlertDialog(
    BuildContext context,
    WidgetRef ref,
    VoidCallback onTap,
    MaterialStateProperty<Color> btnBGColor,
    String? title,
    String body,
    String btnText,
  ) {
    final currentTheme = ref.watch(themeProvider);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: currentTheme.scaffoldBackgroundColor,
          title: Text(
            title ?? "",
            style: currentTheme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(body, style: currentTheme.textTheme.titleSmall),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                backgroundColor: btnBGColor,
              ),
              onPressed: onTap,
              child: Text(btnText, style: currentTheme.textTheme.titleLarge),
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              child: Text("cancel".tr(),
                  style: currentTheme.textTheme.titleLarge?.copyWith()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
