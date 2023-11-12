import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

final class CustomTextField extends ConsumerWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback? onIconButtonPressed;
  final Icon icon;
  final String? isRequiredText;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.onIconButtonPressed,
    required this.icon,
    this.isRequiredText,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isRequiredText != null)
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                isRequiredText!,
                style: currentTheme.textTheme.titleMedium,
              ),
            ),
          SizedBox(
            height: 52,
            child: TextFormField(
              keyboardType: keyboardType,
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: onIconButtonPressed,
                    icon: icon,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  fillColor: currentTheme.scaffoldBackgroundColor,
                  filled: true,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
