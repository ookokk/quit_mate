import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/settings/widget/language_bottom_sheet.dart';
import 'package:quit_mate/src/feature/settings/widget/settings_alert_dialog.dart';
import 'package:quit_mate/src/feature/settings/widget/settings_category_row.dart';
import 'package:quit_mate/src/feature/settings/widget/settings_list_tile.dart';
import 'package:quit_mate/src/feature/settings/widget/theme_switch.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

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
    final userRepository = UserRepository();
    return SafeArea(
        child: Scaffold(
            backgroundColor: currentTheme.scaffoldBackgroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: DeviceSize.kHeight(context) * 0.8,
                    child: ListView(children: [
                      SettingsCategoryRow(
                          headerText: "account".tr(),
                          iconData: Icons.account_circle),
                      buildDeleteAccountTile(
                          context, userRepository, currentTheme),
                      SettingsCategoryRow(
                          headerText: "about".tr(),
                          iconData: Icons.dashboard_customize_outlined),
                      SettingsListTile(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: currentTheme.canvasColor,
                                context: context,
                                builder: (BuildContext context) {
                                  return const LanguageBottomSheet();
                                });
                          },
                          text: "language".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/setBG');
                        },
                        text: "changeBGImage".tr(),
                        trailingChild: Icon(
                          Icons.arrow_forward_ios,
                          color: currentTheme.indicatorColor,
                        ),
                      ),
                      SettingsListTile(
                          text: "darkTheme".tr(),
                          trailingChild: const ThemeSwitch()),
                      SettingsCategoryRow(
                          headerText: "privacy".tr(),
                          iconData: Icons.privacy_tip_outlined),
                      SettingsListTile(
                          text: "privacyPolicy".tr(),
                          onTap: () {
                            Navigator.pushNamed(context, '/privacy');
                          },
                          trailingChild: Icon(Icons.arrow_forward_ios,
                              color: currentTheme.indicatorColor)),
                      SettingsCategoryRow(
                          headerText: "feedback".tr(),
                          iconData: Icons.feedback_outlined),
                      SettingsListTile(
                          text: "rateThisApp".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsCategoryRow(
                          headerText: "notifications".tr(),
                          iconData: Icons.notifications),
                      SettingsListTile(
                          onTap: () {
                            Navigator.pushNamed(context, '/editNotification');
                          },
                          text: "editNotify".tr(),
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                    ]),
                  ),
                ],
              ),
            )));
  }

  SettingsListTile buildDeleteAccountTile(BuildContext context,
      UserRepository userRepository, ThemeData currentTheme) {
    return SettingsListTile(
        onTap: () {
          SettingsAlertDialog().showSettingsAlertDialog(context, ref, () async {
            String? currentID = await CacheManager.getString('userId');
            userRepository.deleteUser(currentID ?? "");
            await CacheManager.setBool('isFirst', true);
            Future.microtask(() => Navigator.pushNamedAndRemoveUntil(
                context, '/getStarted', (route) => false));
          }, MaterialStateProperty.all(Colors.red), "warning".tr(),
              "areYouSureDeleteAccount".tr(), "delete".tr());
        },
        text: "deleteAccount".tr(),
        trailingChild: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete_forever,
            color: currentTheme.indicatorColor,
          ),
        ));
  }
}
