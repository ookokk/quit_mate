import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:quit_mate/src/core/const/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class CustomNumberPicker extends ConsumerStatefulWidget {
  const CustomNumberPicker({
    Key? key,
  }) : super(key: key);
  @override
  WeightPickerState createState() => WeightPickerState();
}

class WeightPickerState extends ConsumerState<CustomNumberPicker> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final weight = ref.watch(frequencyProvider.notifier).state;
    return SizedBox(
      height: DeviceSize.kHeight(context) * 0.4,
      child: Row(
        children: <Widget>[
          NumberPicker(
            textStyle: currentTheme.textTheme.headlineMedium,
            value: weight,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey)),
            minValue: 40,
            maxValue: 150,
            onChanged: (value) {
              setState(() {
                ref.read(frequencyProvider.notifier).state = value;
              });
            },
            itemHeight: 70,
            axis: Axis.vertical,
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            "kFirstWeightKG".tr(),
            style: currentTheme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}

final frequencyProvider = StateProvider<int>((ref) {
  return 70;
});
