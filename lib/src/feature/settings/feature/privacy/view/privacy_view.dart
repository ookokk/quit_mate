import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/padding_insets.dart';
import 'package:quit_mate/src/core/const/strings.dart';
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
      appBar: const CustomAppBar(title: Strings.tPrivacy),
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
                Strings.bLastUpdated,
                style: currentTheme.textTheme.bodyMedium,
              ),
              const CustomSizedBox(),
              Text(
                Strings.bYourSecurity,
                style: currentTheme.textTheme.bodyMedium,
              ),
              const CustomSizedBox(),
              Text(
                Strings.bWe,
                style: currentTheme.textTheme.bodyMedium,
              ),
              const CustomSizedBox(),
              Text(
                Strings.tYourPersonal,
                style: currentTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(),
              Text(Strings.bYourIdentity,
                  style: currentTheme.textTheme.bodyMedium),
              const CustomSizedBox(),
              Text(
                Strings.tPurpose,
                style: currentTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(),
              Text(Strings.bYourPurpose,
                  style: currentTheme.textTheme.bodyMedium),
              const CustomSizedBox(),
              Text(
                Strings.tToWhom,
                style: currentTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(Strings.bToWhom, style: currentTheme.textTheme.bodyMedium),
              const CustomSizedBox(),
              Text(
                Strings.tYourRights,
                style: currentTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(),
              Text(Strings.bPursuant, style: currentTheme.textTheme.bodyMedium),
              Text(Strings.bToLearnA, style: currentTheme.textTheme.bodyMedium),
              Text(Strings.bToLearnB, style: currentTheme.textTheme.bodyMedium),
              Text(Strings.bToLearnC, style: currentTheme.textTheme.bodyMedium),
              Text(Strings.bToLearnD, style: currentTheme.textTheme.bodyMedium),
              Text(Strings.bToLearnE, style: currentTheme.textTheme.bodyMedium),
              const CustomSizedBox(),
              Text(
                Strings.tContact,
                style: currentTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const CustomSizedBox(),
              Text(Strings.bInOrder, style: currentTheme.textTheme.bodyMedium),
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
