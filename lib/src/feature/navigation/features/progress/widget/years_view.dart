import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/viewmodel/years_view_mixin.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

class YearsView extends ConsumerStatefulWidget {
  final UserRepository userRepository = UserRepository();
  YearsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _YearsViewState();
}

class _YearsViewState extends ConsumerState<YearsView> with YearsViewMixin {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return Container(
        color: currentTheme.hoverColor,
        child: Column(
          children: [
            Text(
              Strings.iHaveBeen,
              style: currentTheme.textTheme.bodyMedium
                  ?.copyWith(color: Colors.white),
            )
          ],
        ));
  }
}
