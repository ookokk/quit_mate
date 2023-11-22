import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quit_mate/generated/assets.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/auth/service/auth_manager.dart';
import 'package:quit_mate/src/feature/auth/viewmodel/password_visibility_notifier.dart';
import 'package:quit_mate/src/feature/auth/widget/auth_alert_dialog.dart';
import 'package:quit_mate/src/feature/auth/widget/auth_button.dart';
import 'package:quit_mate/src/feature/auth/widget/custom_text_field.dart';
import 'package:quit_mate/src/feature/auth/widget/navigate_register_or_login_row.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

class LoginView extends ConsumerWidget {
  LoginView({
    Key? key,
  }) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                    Assets.svgGetStarted1,
                    height: 170,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    Strings.login,
                    style: currentTheme.textTheme.headlineLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                      controller: emailController,
                      hintText: Strings.email,
                      obscureText: false,
                      icon: const Icon(
                        Icons.email,
                        color: Colors.blue,
                      )),
                  const SizedBox(
                    height: 18,
                  ),
                  PasswordControllerTextField(
                      passwordController: passwordController,
                      passwordVisibility: passwordVisibility),
                  const SizedBox(
                    height: 18,
                  ),
                  NavigateRegisterOrLoginRow(
                      rowText: Strings.doNotHave,
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      btnText: Strings.register),
                  const SizedBox(
                    height: 18,
                  ),
                  buildAuthButton(authManager, context, ref),
                  TextButton(
                    onPressed: () async {
                      // final SoberUser soberUser = SoberUser();
                      final UserRepository userRepository = UserRepository();
                      final SoberUser? soberUser =
                          await userRepository.getUser("bOf555vXKllaUNNPKNyQ");
                      print(soberUser?.userId);
                      print(soberUser?.addictiveFactor);
                      print(soberUser?.email);
                      print(soberUser?.userName);
                    },
                    child: Text('osman'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AuthButton buildAuthButton(
      AuthManager authManager, BuildContext context, WidgetRef ref) {
    return AuthButton(
      text: Strings.login,
      onTap: () async {
        String? user = await authManager.signIn(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        if (user != null) {
          if (user.toLowerCase().contains("error") ||
              user.toLowerCase().contains("invalid")) {
            Future.microtask(() {
              AuthAlertDialog().showAuthAlertDialog(
                context,
                ref,
                Strings.error,
                user,
              );
            });
          } else {
            final factor = SoberUser().addictiveFactor;
            if (factor == null) {
              Future.microtask(
                  () => Navigator.pushReplacementNamed(context, '/getStarted'));
            } else {
              Future.microtask(() => Navigator.pushNamedAndRemoveUntil(
                  context, '/navigation', (route) => false));
            }
            await CacheManager.setString('token', user);
            authManager.setCurrentUserId();
          }
        } else {
          Future.microtask(() {
            AuthAlertDialog().showAuthAlertDialog(
              context,
              ref,
              Strings.error,
              Strings.anUnexpectedError,
            );
          });
        }
      },
    );
  }
}

class PasswordControllerTextField extends StatelessWidget {
  const PasswordControllerTextField({
    super.key,
    required this.passwordController,
    required this.passwordVisibility,
  });

  final TextEditingController passwordController;
  final PasswordVisibilityNotifier passwordVisibility;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: passwordController,
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
