import 'package:get/get.dart';

import '../../../core/utils/date_utils.dart';

class CalendarController extends GetxController {
    final RxString currentMonth = "".obs;
    final RxString currentYear = "".obs;
    final Rx<DateTime> selectedDay = DateTime.now().obs;
    final Rx<DateTime> previousSunday = DateTime.now().obs;
    final Rx<DateTime> currentSunday = DateTime.now().obs;

    final RxInt calendarTabIndex = 0.obs;


    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateWeekRange(selectedDay.value);
  }

  void handleNextWeek() {
      // selectedDay.value = selectedDay.value.add(const Duration(days: 7));
      updateWeekRange(currentSunday.value.add(const Duration(days: 3)));
  }

  void handlePreviousWeek() {
      // selectedDay.value = selectedDay.value.subtract(const Duration(days: 7));
      updateWeekRange(previousSunday.value.subtract(const Duration(days: 3)));
  }

  void updateWeekRange(DateTime day) {
      previousSunday.value = MyDateUtils.getPreviousSunday(day);
      currentSunday.value = MyDateUtils.getCurrentSunday(day);
      _updateMonthAndYear(day);
  }

  void onSelectedDayChanged(DateTime day) {
      selectedDay.value = day;
      _updateMonthAndYear(day);
      print("On Selected Day Changed: ${selectedDay.value}");
  }

  bool isToday(DateTime day) {
      return day.year == DateTime.now().year &&
          day.month == DateTime.now().month &&
          day.day == DateTime.now().day;
  }

  bool isSelectedDay(DateTime day) {
      return day.year == selectedDay.value.year &&
          day.month == selectedDay.value.month &&
          day.day == selectedDay.value.day;
  }

  bool isWeekends(DateTime day) {
      return day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
  }

  void _updateMonthAndYear(DateTime day) {
      currentMonth.value = MyDateUtils.formatMonth(day);
      currentYear.value = MyDateUtils.formatYear(day);}

  void changeCalenderTab() {
      if (calendarTabIndex.value == 1) {
          calendarTabIndex.value = 0;
      } else {
          calendarTabIndex.value = 1;
      }
  }
}