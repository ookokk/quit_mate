import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/routes.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/splash/splash/view/splash_view.dart';
import 'src/core/init/init_app.dart';

void main() async {
  InitApp().initApp();
  EasyLocalization.logger.enableBuildModes = [];
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      theme: currentTheme,
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
//gitignore düzenlemek lazım
// flutter build appbundle --build-name=0.0.1 --build-number=4
