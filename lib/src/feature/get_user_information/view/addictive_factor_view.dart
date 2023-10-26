import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/addictive_factor_list.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/next_button.dart';
import 'package:quit_mate/src/product/widget/custom_app_bar.dart';

class AddictiveFactorView extends ConsumerWidget {
  const AddictiveFactorView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      floatingActionButton: NextButton(text: Strings.next, onTap: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: const CustomAppBar(),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              Strings.whatAreYou,
              style: currentTheme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: DeviceSize.kHeight(context) * 0.85,
            child: const AddictiveFactorList(),
          ),
        ],
      )),
    ));
  }
}
