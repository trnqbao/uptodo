import "package:intl/intl.dart";

class MyDateUtils {
  static DateTime getPreviousSunday(DateTime date) {
    final int daysToSubtract = date.weekday == 7 ? 7 : date.weekday;
    return date.subtract(Duration(days: daysToSubtract));
  }

  static DateTime getCurrentSunday(DateTime date) {
    final int daysToAdd = date.weekday == 7 ? 0 : 7 - date.weekday;
    return date.add(Duration(days: daysToAdd));
  }

  static String formatYear(DateTime date) {
    return DateFormat('yyyy').format(date);

  }

  static String formatMonth(DateTime date) {
    return DateFormat('MMMM').format(date).toUpperCase();
  }

  static String formatDayOfWeek(DateTime date) {
    return DateFormat('EEE').format(date).toUpperCase();
  }
}