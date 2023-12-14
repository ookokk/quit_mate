import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/viewmodel/sober_chart_viewmodel.dart';
import 'package:quit_mate/src/feature/settings/widget/settings_alert_dialog.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';

class SoberStartPageView extends ConsumerWidget {
  const SoberStartPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final viewModel = ref.read(soberChartProvider);
    final SoberUser soberUser = SoberUser();
    final soberStartDate = viewModel.soberStartDate;
    final formattedStartDate = formatDate(soberStartDate);
    return Container(
      color: currentTheme.hoverColor,
      child: Column(
        children: [
          Expanded(
              child: Text(
            "mySoberStartDate".tr(),
            style: currentTheme.textTheme.bodyMedium
                ?.copyWith(color: Colors.white),
          )),
          Expanded(
              flex: 2,
              child: Text(
                formattedStartDate,
                style: currentTheme.textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              )),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: buildButtonAndTextColumn(
                      context, ref, soberUser, currentTheme, () {
                    SettingsAlertDialog().showSettingsAlertDialog(
                      context,
                      ref,
                      () {
                        soberUser.setSoberStartDate(DateTime.now());
                      },
                      MaterialStateProperty.all<Color>(Colors.transparent),
                      "",
                      "${"areYouSureReset".tr()}\n${"doNotFeel".tr()}",
                      "yes".tr(),
                    );
                  }, Icons.replay_circle_filled_sharp, "reset".tr()),
                ),
                Expanded(
                    child: buildButtonAndTextColumn(
                        context,
                        ref,
                        soberUser,
                        currentTheme,
                        () {},
                        Icons.settings_sharp,
                        "settings".tr())),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildButtonAndTextColumn(
    BuildContext context,
    WidgetRef ref,
    SoberUser soberUser,
    ThemeData currentTheme,
    VoidCallback onTap,
    IconData iconData,
    String text,
  ) {
    return Column(
      children: [
        IconButton(
            onPressed: onTap,
            icon: Icon(
              iconData,
              color: Colors.white,
            )),
        Text(text,
            style: currentTheme.textTheme.bodyMedium
                ?.copyWith(color: Colors.white))
      ],
    );
  }

  String formatDate(DateTime? date) {
    if (date != null) {
      final day = date.day;
      final month = getMonthName(date.month);
      final year = date.year;
      return '$day $month, $year';
    }
    return 'N/A';
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
