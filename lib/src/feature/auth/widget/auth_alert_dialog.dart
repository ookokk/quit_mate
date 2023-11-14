import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class AuthAlertDialog extends ChangeNotifier {
  Future<void> showAuthAlertDialog(BuildContext context, WidgetRef ref,
      String? alertTitle, String? errorMessage) async {
    final currentTheme = ref.watch(themeProvider);
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: currentTheme.scaffoldBackgroundColor,
          title: Text(
            alertTitle ?? Strings.error,
            style: currentTheme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(errorMessage ?? Strings.anUnexpectedError,
                    style: currentTheme.textTheme.titleMedium),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  Text(Strings.okay, style: currentTheme.textTheme.titleLarge),
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
