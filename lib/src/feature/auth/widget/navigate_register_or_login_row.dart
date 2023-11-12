import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class NavigateRegisterOrLoginRow extends ConsumerWidget {
  final String rowText;
  final String btnText;
  final VoidCallback onTap;
  const NavigateRegisterOrLoginRow({
    Key? key,
    required this.rowText,
    required this.onTap,
    required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              rowText,
              style: currentTheme.textTheme.titleMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
          Expanded(
              child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(Colors.black),
              minimumSize: MaterialStateProperty.all<Size>(
                const Size(170, 40),
              ),
              maximumSize: MaterialStateProperty.all<Size>(
                const Size(170, 40),
              ),
              elevation: MaterialStateProperty.all<double>(2),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                currentTheme.scaffoldBackgroundColor,
              ),
            ),
            child: Text(
              btnText,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: currentTheme.textTheme.titleMedium,
            ),
          ))
        ],
      ),
    );
  }
}
