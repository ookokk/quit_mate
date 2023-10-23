import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/cache/cache_manager.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => SplashViewState();
}

class SplashViewState extends ConsumerState<SplashView> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Text(
            'OSMAN',
            style: currentTheme.textTheme.bodySmall,
          ),
          IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
              icon: Icon(Icons.change_circle)),
          IconButton(
              onPressed: () {
                CacheManager.setTheme('siyah tema');
              },
              icon: Icon(Icons.save)),
          IconButton(
              onPressed: () async {
                // print(currentTheme.toString());
                final osk = await CacheManager.getTheme();
                print(osk);
              },
              icon: Icon(Icons.print)),
        ],
      ),
    ));
  }
}
