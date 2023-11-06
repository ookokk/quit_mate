import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

class Deneme extends ConsumerWidget {
  const Deneme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final UserRepository userRepository = UserRepository();

    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Column(
        children: [
          IconButton(
              onPressed: () async {
                final user = await userRepository.getUser('user1234');
                print(user!.soberStartDate.toString());
              },
              icon: Icon(Icons.print))
        ],
      ),
    ));
  }
}
