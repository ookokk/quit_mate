import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/routes.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/set_bg_image/view/set_bg_image_view.dart';
import 'src/core/init/init_app.dart';

void main() {
  InitApp().initApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      theme: currentTheme,
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: SetBGImageView(),
    );
  }
}
