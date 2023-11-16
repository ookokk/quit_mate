import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';

class CustomNumberPickerDaily extends ConsumerStatefulWidget {
  const CustomNumberPickerDaily({
    Key? key,
    required this.minValue,
    required this.maxValue,
  }) : super(key: key);
  final int minValue;
  final int maxValue;
  @override
  WeightPickerState createState() => WeightPickerState();
}

class WeightPickerState extends ConsumerState<CustomNumberPickerDaily> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final drinkTimePerMeal = ref.watch(dailyFrequencyProvider.notifier).state;
    final SoberUser soberUser = SoberUser();
    return SizedBox(
      height: DeviceSize.kHeight(context) * 0.4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NumberPicker(
            textStyle: currentTheme.textTheme.titleSmall,
            value: drinkTimePerMeal,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey)),
            minValue: widget.minValue,
            maxValue: widget.maxValue,
            onChanged: (value) {
              setState(() {
                ref.read(dailyFrequencyProvider.notifier).state = value;
                soberUser.setDailyUseOnDays(value);
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

final dailyFrequencyProvider = StateProvider<int>((ref) {
  return 0;
});
