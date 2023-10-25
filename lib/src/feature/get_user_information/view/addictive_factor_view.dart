import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/product/model/addictive_factor/addictive_factor.dart';
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
      appBar: CustomAppBar(),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.whatAreYou,
              style: currentTheme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: DeviceSize.kHeight(context) * 0.85,
            child: ListView(
              children: AddictiveFactor()
                  .addictiveFactorList
                  .map((item) => ListTile(
                        title: Text(item),
                      ))
                  .toList(),
            ),
          ),
        ],
      )),
    ));
  }
}
