import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class GetStartedButton extends ConsumerWidget {
  final VoidCallback? onTap;
  final String? text;
  final Color? color;
  final TextStyle? textStyle;
  final Color? borderColor;

  const GetStartedButton({
    Key? key,
    this.textStyle,
    this.borderColor,
    this.color,
    this.onTap,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(
            DeviceSize.kWidth(context) * 0.85,
            68,
          ),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(
            DeviceSize.kWidth(context) * 0.85,
            68,
          ),
        ),
        elevation: MaterialStateProperty.all<double>(3),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? currentTheme.cardColor,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
      ),
      child: Text(
        text ?? "",
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.fade,
        style: textStyle ??
            currentTheme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }
}
