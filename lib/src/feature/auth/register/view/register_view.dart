import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quit_mate/generated/assets.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/auth/service/auth_manager.dart';
import 'package:quit_mate/src/feature/auth/viewmodel/password_visibility_notifier.dart';
import 'package:quit_mate/src/feature/auth/widget/auth_alert_dialog.dart';
import 'package:quit_mate/src/feature/auth/widget/auth_elevated_button.dart';
import 'package:quit_mate/src/feature/auth/widget/custom_text_field.dart';
import 'package:quit_mate/src/feature/auth/widget/navigate_register_or_login_row.dart';

class RegisterView extends ConsumerWidget {
  RegisterView({
    Key? key,
  }) : super(key: key);
  final TextEditingController emailCnt = TextEditingController();
  final TextEditingController pwCnt = TextEditingController();
  final TextEditingController pwAgainCnt = TextEditingController();
  final TextEditingController usernameCnt = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final authManager = AuthManager();
    final passwordVisibility = ref.watch(passwordVisibilityProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              Assets.svgBg,
              fit: BoxFit.cover,
              height: DeviceSize.kHeight(context),
              width: DeviceSize.kWidth(context),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset(
                    Assets.svgRegister,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    Strings.register,
                    style: currentTheme.textTheme.headlineLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                      controller: usernameCnt,
                      hintText: Strings.username,
                      obscureText: false,
                      icon: const Icon(Icons.contact_mail)),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                      controller: emailCnt,
                      hintText: Strings.email,
                      obscureText: false,
                      icon: const Icon(Icons.email)),
                  const SizedBox(
                    height: 18,
                  ),
                  PasswordTextField(
                      pwCnt: pwCnt, passwordVisibility: passwordVisibility),
                  const SizedBox(
                    height: 18,
                  ),
                  PasswordAgainTextField(
                      pwAgainCnt: pwAgainCnt,
                      passwordVisibility: passwordVisibility),
                  const SizedBox(
                    height: 18,
                  ),
                  NavigateRegisterOrLoginRow(
                      rowText: Strings.already,
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      btnText: Strings.login),
                  const SizedBox(
                    height: 48,
                  ),
                  buildAuthElevatedButton(context, ref, authManager)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AuthElevatedButton buildAuthElevatedButton(
      BuildContext context, WidgetRef ref, AuthManager authManager) {
    return AuthElevatedButton(
      text: Strings.register,
      onTap: () async {
        try {
          if (pwCnt.text != pwAgainCnt.text) {
            AuthAlertDialog().showAuthAlertDialog(
                context, ref, Strings.error, Strings.pwDoNotMatch);
            return;
          }
          await authManager.registerWithEmailAndPassword(
            emailCnt.text,
            pwCnt.text,
          );
          Future.microtask(() => AuthAlertDialog().showAuthAlertDialog(
              context, ref, Strings.success, Strings.userCreated));
        } catch (e) {
          String errorMessage = e.toString().toLowerCase();
          if (errorMessage.contains("error") ||
              errorMessage.contains("email-already-in-use") ||
              errorMessage.contains("invalid")) {
            Future.microtask(() {
              AuthAlertDialog().showAuthAlertDialog(
                context,
                ref,
                Strings.error,
                errorMessage,
              );
            });
          } else {
            Future.microtask(() {
              AuthAlertDialog().showAuthAlertDialog(
                context,
                ref,
                Strings.error,
                'An unexpected error occurred.',
              );
            });
          }
        }
      },
    );
  }
}

class PasswordAgainTextField extends StatelessWidget {
  const PasswordAgainTextField({
    super.key,
    required this.pwAgainCnt,
    required this.passwordVisibility,
  });

  final TextEditingController pwAgainCnt;
  final PasswordVisibilityNotifier passwordVisibility;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: pwAgainCnt,
      hintText: Strings.passwordAgain,
      obscureText: passwordVisibility.isPasswordObscured,
      icon: passwordVisibility.isPasswordObscured
          ? const Icon(
              Icons.lock,
              color: Colors.blue,
            )
          : const Icon(
              Icons.lock_open,
              color: Colors.blue,
            ),
      onIconButtonPressed: () {
        passwordVisibility.togglePasswordVisibility();
      },
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.pwCnt,
    required this.passwordVisibility,
  });

  final TextEditingController pwCnt;
  final PasswordVisibilityNotifier passwordVisibility;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: pwCnt,
      hintText: Strings.password,
      obscureText: passwordVisibility.isPasswordObscured,
      icon: passwordVisibility.isPasswordObscured
          ? const Icon(
              Icons.lock,
              color: Colors.blue,
            )
          : const Icon(
              Icons.lock_open,
              color: Colors.blue,
            ),
      onIconButtonPressed: () {
        passwordVisibility.togglePasswordVisibility();
      },
    );
  }
}
