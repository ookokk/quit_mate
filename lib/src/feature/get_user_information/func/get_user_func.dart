import 'package:intl/intl.dart';

class GetUserFunc {
  DateTime formatDateTime(DateTime dateTime) {
    final dateFormat = DateFormat("dd.MM.yyyy");
    final formattedDate = dateFormat.format(dateTime);
    return DateTime.parse(formattedDate);
  }
}
