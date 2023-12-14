import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/generated/codegen_loader.g.dart';
import 'package:quit_mate/src/core/const/routes.dart';
import 'package:quit_mate/src/core/language/language_manager.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/splash/splash/view/splash_view.dart';
import 'src/core/init/init_app.dart';

void main() {
  InitApp().initApp();
  EasyLocalization.logger.enableBuildModes = [];
  runApp(EasyLocalization(
      startLocale: LanguageManager.instance.currentLocale,
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      child: const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: currentTheme,
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
