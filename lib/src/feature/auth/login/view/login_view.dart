import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quit_mate/generated/assets.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/auth/service/auth_manager.dart';
import 'package:quit_mate/src/feature/auth/widget/auth_alert_dialog.dart';
import 'package:quit_mate/src/feature/auth/widget/auth_elevated_button.dart';
import 'package:quit_mate/src/feature/auth/widget/custom_text_field.dart';

final class LoginView extends ConsumerWidget {
  LoginView({
    Key? key,
  }) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final authManager = AuthManager();
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
                      icon: const Icon(Icons.email)),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                      controller: passwordController,
                      hintText: Strings.password,
                      obscureText: false,
                      icon: const Icon(Icons.lock)),
                  const SizedBox(
                    height: 48,
                  ),
                  AuthElevatedButton(
                    text: Strings.login,
                    onTap: () async {
                      String? user =
                          await authManager.signInWithEmailAndPassword(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (user != null) {
                        if (user.toLowerCase().contains("error")) {
                          Future.delayed(const Duration(milliseconds: 10), () {
                            AuthAlertDialog().showAuthAlertDialog(
                              context,
                              ref,
                              Strings.error,
                              user,
                            );
                          });
                        } else {
                          print('Başarılı giriş, token: $user');
                        }
                      } else {
                        print('navigate yap');
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
