import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/settings/widget/language_bottom_sheet.dart';
import 'package:quit_mate/src/feature/settings/widget/settings_category_row.dart';
import 'package:quit_mate/src/feature/settings/widget/settings_list_tile.dart';
import 'package:quit_mate/src/feature/settings/widget/theme_switch.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
            backgroundColor: currentTheme.scaffoldBackgroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: DeviceSize.kHeight(context) * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/animations/settings.json',
                          animate: true,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: DeviceSize.kHeight(context) * 0.8,
                    child: ListView(children: [
                      SettingsCategoryRow(
                          headerText: "kSettingsPersonal".tr(),
                          iconData: Icons.account_circle),
                      SettingsListTile(
                          text: "kSettingsGender".tr(),
                          trailingChild: Text(
                            "",
                            style: currentTheme.textTheme.headlineLarge,
                          )),
                      SettingsListTile(
                          text: "kSettingsWeight".tr(),
                          trailingChild: Text(
                            "",
                            style: currentTheme.textTheme.headlineLarge,
                          )),
                      SettingsListTile(
                          text: "kSettingsExerciseFrequency".tr(),
                          trailingChild: Text(
                            "",
                            style: currentTheme.textTheme.headlineLarge,
                          )),
                      SettingsListTile(
                          text: "kSettingsWakeUpTime".tr(),
                          trailingChild: Text(
                            '',
                            style: currentTheme.textTheme.headlineLarge,
                          )),
                      SettingsListTile(
                          text: "kSettingsBedTime".tr(),
                          trailingChild: Text(
                            '',
                            style: currentTheme.textTheme.headlineLarge,
                          )),
                      SettingsListTile(
                          onTap: () {},
                          text: "kSettingsEditPersonal".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsListTile(
                          onTap: () {},
                          text: "kSettingsReset".tr(),
                          trailingChild: Icon(
                            Icons.refresh,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsCategoryRow(
                          headerText: "kSettingsMore".tr(),
                          iconData: Icons.dashboard_customize_outlined),
                      SettingsListTile(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return const LanguageBottomSheet();
                                });
                          },
                          text: "kSettingsLanguage".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsListTile(
                          text: "kSettingsDarkTheme".tr(),
                          trailingChild: const ThemeSwitch()),
                    ]),
                  ),
                ],
              ),
            )));
  }
}
