import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class SoberStartDateTimePicker extends ConsumerStatefulWidget {
  SoberStartDateTimePicker({Key? key}) : super(key: key);

  @override
  SoberStartDateTimePickerState createState() =>
      SoberStartDateTimePickerState();
}

class SoberStartDateTimePickerState
    extends ConsumerState<SoberStartDateTimePicker> {
  DateTime? selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return TextButton(
      onPressed: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null) {
          selectedDate = picked;
        }
      },
      child: Text(
        selectedDate != null
            ? "Seçilen Tarih: ${selectedDate?.toLocal()}".split(' ')[0]
            : "Tarih Seç",
      ),
    );
  }
}
