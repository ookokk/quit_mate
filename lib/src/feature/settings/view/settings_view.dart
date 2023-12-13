import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
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
                      const SettingsCategoryRow(
                          headerText: Strings.account,
                          iconData: Icons.account_circle),
                      buildDeleteAccountTile(
                          context, userRepository, currentTheme),
                      const SettingsCategoryRow(
                          headerText: Strings.about,
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
                          text: Strings.language,
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      SettingsListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/setBG');
                        },
                        text: Strings.changeBGImage,
                        trailingChild: Icon(
                          Icons.arrow_forward_ios,
                          color: currentTheme.indicatorColor,
                        ),
                      ),
                      const SettingsListTile(
                          text: Strings.darkTheme,
                          trailingChild: ThemeSwitch()),
                      const SettingsCategoryRow(
                          headerText: Strings.privacy,
                          iconData: Icons.privacy_tip_outlined),
                      SettingsListTile(
                          text: Strings.privacyPolicy,
                          onTap: () {
                            Navigator.pushNamed(context, '/privacy');
                          },
                          trailingChild: Icon(Icons.arrow_forward_ios,
                              color: currentTheme.indicatorColor)),
                      const SettingsCategoryRow(
                          headerText: Strings.feedback,
                          iconData: Icons.feedback_outlined),
                      SettingsListTile(
                          text: Strings.rateThisApp,
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      const SettingsCategoryRow(
                          headerText: Strings.notifications,
                          iconData: Icons.notifications),
                      SettingsListTile(
                          onTap: () {
                            Navigator.pushNamed(context, '/editNotification');
                          },
                          text: Strings.editNotify,
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
          }, MaterialStateProperty.all(Colors.red), Strings.warning,
              Strings.areYouSureDeleteAccount, Strings.delete);
        },
        text: Strings.deleteAccount,
        trailingChild: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete_forever,
            color: currentTheme.indicatorColor,
          ),
        ));
  }
}
