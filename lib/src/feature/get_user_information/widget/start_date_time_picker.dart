import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/get_user_information/viewmodel/selected_date_viewmodel.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';

class StartDateTimePicker extends ConsumerWidget {
  const StartDateTimePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final SoberUser soberUser = SoberUser();
    Future<void> selectDate(BuildContext context) async {
      final DateTime picked = (await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          )) ??
          DateTime.now();

      final formattedDate = DateFormat('dd.MM.yyyy').format(picked);
      ref.read(selectedDateProvider.notifier).state = formattedDate;
      soberUser.setSoberStartDate(picked);
    }

    return Column(
      children: [
        IconButton(
          onPressed: () {
            selectDate(context);
          },
          icon: Icon(
            Icons.calendar_month,
            color: currentTheme.indicatorColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
