import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/padding_insets.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/product/widget/custom_app_bar.dart';

class PrivacyView extends ConsumerWidget {
  const PrivacyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(title: "tPrivacy".tr()),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets().kHighPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.start,
                "bLastUpdated".tr(),
                style: currentTheme.textTheme.bodyMedium,
              ),
              const CustomSizedBox(),
              Text(
                "bYourSecurity".tr(),
                style: currentTheme.textTheme.bodyMedium,
              ),
              const CustomSizedBox(),
              Text(
                "bWe".tr(),
                style: currentTheme.textTheme.bodyMedium,
              ),
              const CustomSizedBox(),
              Text(
                "tYourPersonal".tr(),
                style: currentTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(),
              Text("bYourIdentity".tr(),
                  style: currentTheme.textTheme.bodyMedium),
              const CustomSizedBox(),
              Text(
                "tPurpose".tr(),
                style: currentTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(),
              Text("bYourPurpose".tr(),
                  style: currentTheme.textTheme.bodyMedium),
              const CustomSizedBox(),
              Text(
                "tToWhom".tr(),
                style: currentTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 6,
              ),
              Text("bToWhom".tr(), style: currentTheme.textTheme.bodyMedium),
              const CustomSizedBox(),
              Text(
                "tYourRights".tr(),
                style: currentTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(),
              Text("bPursuant".tr(), style: currentTheme.textTheme.bodyMedium),
              Text("bToLearnA".tr(), style: currentTheme.textTheme.bodyMedium),
              Text("bToLearnB".tr(), style: currentTheme.textTheme.bodyMedium),
              Text("bToLearnC".tr(), style: currentTheme.textTheme.bodyMedium),
              Text("bToLearnD".tr(), style: currentTheme.textTheme.bodyMedium),
              Text("bToLearnE".tr(), style: currentTheme.textTheme.bodyMedium),
              const CustomSizedBox(),
              Text(
                "tContact".tr(),
                style: currentTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(),
              Text("bInOrder".tr(), style: currentTheme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    ));
  }
}

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 6,
    );
  }
}
