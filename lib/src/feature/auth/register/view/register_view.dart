import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quit_mate/src/core/const/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/auth/widget/auth_elevated_button.dart';
import 'package:quit_mate/src/feature/auth/widget/custom_text_field.dart';

class RegisterView extends ConsumerWidget {
  RegisterView({
    Key? key,
  }) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/bg.svg',
              fit: BoxFit.cover,
              height: DeviceSize.kHeight(context),
              width: DeviceSize.kWidth(context),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                SvgPicture.asset(
                  'assets/svg/register.svg',
                  height: 170,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  Strings.register,
                  style: currentTheme.textTheme.displaySmall?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTextField(
                    controller: usernameController,
                    hintText: Strings.username,
                    obscureText: false,
                    icon: const Icon(Icons.contact_mail)),
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
                  height: 18,
                ),
                AuthElevatedButton(text: "Register"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'change',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
