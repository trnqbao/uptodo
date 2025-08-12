import 'package:flutter/material.dart';

import '../../../core/utils/date_utils.dart';

class DateCard extends StatelessWidget {
  final bool isToday;
  final bool isSelectedDay;
  final bool isWeekends;
  final DateTime date;
  final BuildContext context;
  const DateCard({super.key, required this.isToday, required this.isSelectedDay, required this.isWeekends, required this.date, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 65,
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: isSelectedDay ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            MyDateUtils.formatDayOfWeek(date),
            style: TextStyle(
              color: isWeekends
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.onPrimary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            date.day.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isToday && !isSelectedDay)
            Container(
              margin: const EdgeInsets.only(top: 1),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
