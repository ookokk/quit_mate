import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/get_user_information/viewmodel/selected_date_viewmodel.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/start_date_time_picker.dart';

class SoberStartDateRow extends ConsumerStatefulWidget {
  const SoberStartDateRow({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SoberStartDateRowState();
}

class _SoberStartDateRowState extends ConsumerState<SoberStartDateRow> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final selectedDate = ref.read(selectedDateProvider.notifier).state;
    return Card(
      color: currentTheme.hoverColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            selectedDate.toString(),
            style: currentTheme.textTheme.headlineSmall,
          )),
          const Expanded(flex: 2, child: StartDateTimePicker()),
        ],
      ),
    );
  }
}
