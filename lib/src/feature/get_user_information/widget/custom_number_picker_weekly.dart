import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:quit_mate/src/core/const/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class CustomNumberPickerWeekly extends ConsumerStatefulWidget {
  const CustomNumberPickerWeekly({
    Key? key,
    required this.minValue,
    required this.maxValue,
  }) : super(key: key);
  final int minValue;
  final int maxValue;
  @override
  WeightPickerState createState() => WeightPickerState();
}

class WeightPickerState extends ConsumerState<CustomNumberPickerWeekly> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final numberOfDays = ref.watch(weeklyFrequencyProvider.notifier).state;
    return SizedBox(
      height: DeviceSize.kHeight(context) * 0.4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NumberPicker(
            textStyle: currentTheme.textTheme.titleSmall,
            value: numberOfDays,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey)),
            minValue: widget.minValue,
            maxValue: widget.maxValue,
            onChanged: (value) {
              setState(() {
                ref.read(weeklyFrequencyProvider.notifier).state = value;
              });
            },
            itemHeight: 50,
            axis: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}

final weeklyFrequencyProvider = StateProvider<int>((ref) {
  return 0;
});
