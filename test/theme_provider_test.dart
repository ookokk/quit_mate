import 'package:flutter_test/flutter_test.dart';
import 'package:quit_mate/src/core/init/cache/cache_manager.dart';
import 'package:quit_mate/src/core/init/theme/theme_provider.dart';

void main() {
  test('toggleTheme should change the current theme and save it', () async {
    final themeProvider = ThemeProvider();

    expect(themeProvider.getCurrentTheme, equals(ThemeProvider.lightTheme));

    themeProvider.toggleTheme();

    expect(themeProvider.getCurrentTheme, equals(ThemeProvider.darkTheme));

    final savedTheme = await CacheManager.getTheme();
    expect(savedTheme, equals(ThemeProvider.darkTheme.toString()));

    themeProvider.toggleTheme();

    expect(themeProvider.getCurrentTheme, equals(ThemeProvider.lightTheme));

    final restoredTheme = await CacheManager.getTheme();
    expect(restoredTheme, equals(ThemeProvider.lightTheme.toString()));
  });
}
