import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/auth/service/auth_manager.dart';

class SettingsAlertDialog {
  Future<void> showSettingsAlertDialog(
    BuildContext context,
    WidgetRef ref,
  ) {
    final currentTheme = ref.watch(themeProvider);
    final authManager = AuthManager();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: currentTheme.scaffoldBackgroundColor,
          title: Text(
            Strings.warning,
            style: currentTheme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(Strings.areYouSure,
                    style: currentTheme.textTheme.titleMedium),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(Strings.cancel,
                  style: currentTheme.textTheme.titleLarge?.copyWith()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade400),
              ),
              child: Text(Strings.signOut,
                  style: currentTheme.textTheme.titleLarge),
              onPressed: () {
                authManager.signOut();
                //  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
