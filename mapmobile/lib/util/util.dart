String getCurrentTime() {
  DateTime now = DateTime.now();
  int hour = now.hour;
  int minute = now.minute;
  String period = hour >= 12 ? 'pm' : 'am';

  // Convert 24-hour time to 12-hour time
  if (hour == 0) {
    hour = 12; // Midnight case
  } else if (hour > 12) {
    hour -= 12;
  }

  // Format minute to always be two digits
  String minuteStr = minute < 10 ? '0$minute' : '$minute';

  return '$hour:$minuteStr $period';
}

String getCurrentDate() {
  DateTime now = DateTime.now();
  int day = now.day;
  int month = now.month;
  int year = now.year;

  // Format day and month to always be two digits
  String dayStr = day < 10 ? '0$day' : '$day';
  String monthStr = month < 10 ? '0$month' : '$month';

  return '$dayStr.$monthStr.$year';
}
