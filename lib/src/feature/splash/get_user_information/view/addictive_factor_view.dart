import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/addictive_factor_list.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/custom_percent_indicator.dart';

class AddictiveFactorView extends ConsumerWidget {
  const AddictiveFactorView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          const CustomPercentIndicator(percent: 0.2),
          const SizedBox(
            height: 18,
          ),
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
