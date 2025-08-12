import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/calendar_controller.dart';
import 'date_card.dart';

class WeeklyCalendarWidget extends GetView<CalendarController> {
  const WeeklyCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_left, color: Theme.of(context).colorScheme.onPrimary),
                    onPressed: () {
                      controller.handlePreviousWeek();
                    },
                  ),
                  Column(
                      children: [
                        Obx(() => Text(
                            controller.currentMonth.value,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ),
                        const SizedBox(height: 5),
                        Obx(() => Text(
                            controller.currentYear.value,
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodySmall!.color,
                              fontSize: 16,
                            ),
                          )
                        )
                      ]
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_right, color: Theme.of(context).colorScheme.onPrimary),
                      onPressed: () {
                        controller.handleNextWeek();
                      }
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (index) {
                  final DateTime date = controller.previousSunday.value.add(Duration(days: index));
                  final bool isSelectedDay = controller.isSelectedDay(date);
                  return GestureDetector(
                    onTap: () {
                      controller.onSelectedDayChanged(date);
                    },
                    child: DateCard(
                      isToday: controller.isToday(date),
                      isSelectedDay: isSelectedDay,
                      isWeekends: controller.isWeekends(date),
                      date: date,
                      context: context,
                    ),
                  );
                }),
              )),
            ],
          )
      );
  }
}