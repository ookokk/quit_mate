import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/viewmodel/selected_date_viewmodel.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/start_date_time_picker.dart';

class SoberStartDateRow extends ConsumerStatefulWidget {
  const SoberStartDateRow({
    super.key,
  });

  @override
  ConsumerState createState() => _SoberStartDateRowState();
}

class _SoberStartDateRowState extends ConsumerState<SoberStartDateRow> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final selectedDate = ref.watch(selectedDateProvider);
    return Card(
      color: currentTheme.hoverColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  selectedDate,
                  style: currentTheme.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              )),
          const Expanded(child: StartDateTimePicker()),
        ],
      ),
    );
  }
}
