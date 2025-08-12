import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/calendar/controllers/calendar_controller.dart';
import 'package:uptodo/modules/calendar/widgets/weekly_calendar_widget.dart';


class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WeeklyCalendarWidget(),

        const SizedBox(height: 10,),

        _buildTaskTabs(context),

        Expanded(
          child: Obx(() {
            if (controller.calendarTabIndex.value == 0) {
              return const Center(child: Text("Today's Tasks", style: TextStyle(color: Colors.white)));
            } else {
              return const Center(child: Text("Completed Tasks", style: TextStyle(color: Colors.white)));
            }
          }),
        )
      ],
    );
  }


  Widget _buildTaskTabs(BuildContext context) {
    return Obx(
          () => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => controller.changeCalenderTab(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.calendarTabIndex.value == 0
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    foregroundColor: controller.calendarTabIndex.value == 0
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).textTheme.bodySmall!.color,

                  ),
                  child: const Text("Today"),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => controller.changeCalenderTab(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.calendarTabIndex.value == 1
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    foregroundColor: controller.calendarTabIndex.value == 1
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).textTheme.bodySmall!.color,
                  ),
                  child: const Text("Completed"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}