import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/widget/years_view.dart';

mixin YearsViewMixin on ConsumerState<YearsView> {
  double yearInformation = 0;
  double dayInformation = 0;

  @override
  void initState() {
    getUserInformation();
    super.initState();
  }

  void getUserInformation() async {
    final user = await widget.userRepository.getUser('user123');

    if (user?.soberStartDate != null) {
      DateTime currentDate = DateTime.now();
      DateTime soberStartDate = user!.soberStartDate!;

      int yearDifference = currentDate.year - soberStartDate.year;
      int dayDifference = currentDate.difference(soberStartDate).inDays;

      setState(() {
        yearInformation = yearDifference.toDouble();
        dayInformation = dayDifference.toDouble();
      });
    }
  }
}
