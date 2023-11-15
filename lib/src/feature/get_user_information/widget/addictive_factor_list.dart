import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/product/model/addictive_factor/addictive_factor.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

class AddictiveFactorList extends ConsumerStatefulWidget {
  const AddictiveFactorList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddictiveFactorListState();
}

class _AddictiveFactorListState extends ConsumerState<AddictiveFactorList> {
  String? selectedAddictiveFactor = "Alcohol";
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    final userRepository = UserRepository();
    return SizedBox(
      height: DeviceSize.kHeight(context) * 0.85,
      child: ListView(
        children: AddictiveFactor().addictiveFactorList.map((item) {
          return ListTile(
            title: Text(
              item,
              style: currentTheme.textTheme.bodyLarge,
            ),
            trailing: selectedAddictiveFactor == item
                ? const Icon(
                    Icons.check,
                    color: Colors.black,
                  )
                : null,
            onTap: () {
              setState(() {
                selectedAddictiveFactor = item;
                final SoberUser user = SoberUser(
                    userName: "",
                    addictiveFactor: item,
                    soberStartDate: DateTime.now(),
                    weeklyUse: 0,
                    dailyUseOnDays: 0,
                    pledgeTime: const TimeOfDay(minute: 0, hour: 0),
                    reviewTime: const TimeOfDay(minute: 0, hour: 0));
                userRepository.saveUser('user123', user);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
