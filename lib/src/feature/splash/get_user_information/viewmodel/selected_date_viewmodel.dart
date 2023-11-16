import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final selectedDateProvider = StateProvider<String>((ref) {
  final now = DateTime.now();
  final formattedDate = DateFormat('dd.MM.yyyy').format(now);
  return formattedDate;
});

class SelectedDateViewModel extends ChangeNotifier {}
