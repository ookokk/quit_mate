import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/routes.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/home/view/home_view.dart';

void main() {
  //InitApp().initApp();
  runApp(const ProviderScope(child: MyApp()));
}

//gün saat dakika saniye
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      theme: currentTheme,
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
