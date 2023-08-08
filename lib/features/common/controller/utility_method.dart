import 'package:intl/intl.dart';

String dateFormatter({required DateTime? date, String format = 'yyyy-MM-dd'}) {
  if (date == null) return 'unknown_date';
  return DateFormat(format).format(date);
}
