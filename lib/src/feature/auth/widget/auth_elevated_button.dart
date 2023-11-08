import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

final class AuthElevatedButton extends ConsumerWidget {
  final VoidCallback? onTap;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final Color? borderColor;

  const AuthElevatedButton({
    Key? key,
    this.textStyle,
    this.borderColor,
    this.color,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);

    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: borderColor ?? currentTheme.hoverColor),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(DeviceSize.kWidth(context) * 0.9,
              DeviceSize.kHeight(context) * 0.03),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity - 100, DeviceSize.kHeight(context) * 0.065),
        ),
        elevation: MaterialStateProperty.all<double>(3),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? currentTheme.canvasColor,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.fade,
        style: textStyle ??
            currentTheme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
