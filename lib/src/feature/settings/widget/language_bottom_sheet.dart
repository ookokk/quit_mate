import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/language/enums/locales.dart';
import 'package:quit_mate/src/core/language/language_manager.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class LanguageBottomSheet extends ConsumerWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: currentTheme.canvasColor,
                  blurRadius: 5,
                  offset: const Offset(0, 3))
            ],
            color: currentTheme.canvasColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildListTile(currentTheme, context, "English", () {
                LanguageManager.instance.updateLanguage(context, Locales.en);
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Turkish", () {
                LanguageManager.instance.updateLanguage(context, Locales.tr);
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Arabic", () {
                LanguageManager.instance.updateLanguage(context, Locales.ar);
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "German", () {
                LanguageManager.instance.updateLanguage(context, Locales.de);
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Spanish", () {
                LanguageManager.instance.updateLanguage(context, Locales.es);
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "French", () {
                LanguageManager.instance.updateLanguage(context, Locales.fr);
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Japanese", () {
                LanguageManager.instance.updateLanguage(context, Locales.ja);
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Chinese", () {
                LanguageManager.instance.updateLanguage(context, Locales.zh);
                Navigator.pop(context);
              }),
              buildListTile(currentTheme, context, "Russian", () {
                LanguageManager.instance.updateLanguage(context, Locales.ru);
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(ThemeData currentTheme, BuildContext context,
      String listTileText, VoidCallback listTileOnTap) {
    return ListTile(
      leading: const Icon(
        Icons.language,
        color: Colors.white,
      ),
      title: Text(
        listTileText,
        style:
            currentTheme.textTheme.titleMedium?.copyWith(color: Colors.white),
      ),
      onTap: listTileOnTap,
    );
  }
}
