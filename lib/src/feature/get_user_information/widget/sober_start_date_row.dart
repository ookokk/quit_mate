import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/sober_start_date_time_picker.dart';

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
    return Card(
      child: Row(
        children: [SoberStartDateTimePicker()],
      ),
    );
  }
}
