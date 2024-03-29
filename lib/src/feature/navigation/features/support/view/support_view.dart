import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class SupportView extends ConsumerWidget {
  const SupportView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return Column(
      children: [
        const SizedBox(
          height: 18,
        ),
        Container(
          width: DeviceSize.kWidth(context) * 0.8,
          color: currentTheme.cardColor,
          child: Column(
            children: [
              Text(
                "onlineTherapy".tr(),
                style: currentTheme.textTheme.titleMedium
                    ?.copyWith(color: Colors.white),
                textAlign: TextAlign.start,
              ),
              SvgPicture.asset(
                'assets/svg/online.svg',
                height: 270,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: DeviceSize.kWidth(context) * 0.8,
          color: currentTheme.cardColor,
          child: Column(
            children: [
              Text(
                "alumni".tr(),
                style: currentTheme.textTheme.titleMedium
                    ?.copyWith(color: Colors.white),
                textAlign: TextAlign.start,
              ),
              SvgPicture.asset(
                'assets/svg/alumni.svg',
                height: 270,
              )
            ],
          ),
        ),
      ],
    );
  }
}
