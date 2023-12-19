import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/product/model/addictive_factor/addictive_factor.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';

class AddictiveFactorList extends ConsumerStatefulWidget {
  const AddictiveFactorList({
    super.key,
  });

  @override
  ConsumerState createState() => _AddictiveFactorListState();
}

class _AddictiveFactorListState extends ConsumerState<AddictiveFactorList> {
  String? selectedAddictiveFactor = "Undefined";
  final SoberUser soberUser = SoberUser();
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
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
                soberUser.setAddictiveFactor(item);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
