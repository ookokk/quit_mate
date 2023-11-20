import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/navigation/features/community/widget/user_avatar_row.dart';

class TweetView extends ConsumerWidget {
  const TweetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return Container(
      height: DeviceSize.kHeight(context),
      color: currentTheme.cardColor,
      child: Column(
        children: [UserAvatarRow()],
      ),
    );
  }
}
