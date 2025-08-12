import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/task_form/controllers/task_form_controller.dart';
import 'package:uptodo/modules/task_form/widgets/action_icon.dart';

class DateTimeSelector extends GetView<TaskFormController> {
  const DateTimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String displayString = "Select Date & Time";
      if (controller.selectedDateTime.value != null) {
        displayString = controller.fullDateTimeFormat
            .format(controller.selectedDateTime.value!);
      }

      return ActionIcon(
        icon: Icons.timer_outlined,
        onTap: () {
          controller.onSelectDateTime(context);
        },
        tooltip: displayString,
      );
    });
  }
}
