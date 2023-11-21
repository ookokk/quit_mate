import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

class UserAvatarRow extends ConsumerWidget {
  const UserAvatarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final userRepository = UserRepository();
    return Container(
      height: DeviceSize.kWidth(context) * 0.25,
      color: Colors.red,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.welcomeBack,
                        style: currentTheme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 58,
                      ),
                      Icon(
                        Icons.waving_hand,
                        color: currentTheme.canvasColor,
                      ),
                      TextButton(
                          onPressed: () async {
                            final user = await userRepository.getUser();
                            if (user != null) {
                              print(user.userName);
                            } else {
                              print('User not found');
                            }
                          },
                          child: Text('PRESS'))
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [Text('Christopher Flores')],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CircleAvatar(
              backgroundColor: currentTheme.scaffoldBackgroundColor,
              radius: 30,
              child: Text(
                'AI',
                style: currentTheme.textTheme.titleLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
