import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/global_widgets/my_text_field.dart';
import 'package:uptodo/modules/task_form/controllers/task_form_controller.dart';
import 'package:uptodo/modules/task_form/widgets/action_icon.dart';
import 'package:uptodo/modules/task_form/widgets/priority_selector_field.dart';

import '../../../core/constants/app_strings.dart';
import '../widgets/category_selector_field.dart';
import '../widgets/date_time_selector_field.dart';

class TaskFormView extends GetView<TaskFormController> {
  const TaskFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color focusColor = colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // title
            Text(
              AppStrings.addTask,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            const SizedBox(
              height: 20,
            ),

            // add task title
            MyTextField(
              hintText: "Task Title",
              // backgroundColor: Colors.grey,
              focusColor: focusColor,
                controller: controller.titleController,),

            const SizedBox(
              height: 20,
            ),

            // add task description
            MyTextField(
              hintText: "Description",
              focusColor: focusColor,
              controller: controller.descriptionController,),

            const SizedBox(
              height: 40,
            ),
            // row: time, category, priority, and add-button
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // time
                      DateTimeSelector(),
                      // category
                      CategorySelector(),
                      // priority
                      TaskPrioritySelector(),
                    ],
                  ),
                  ActionIcon(
                      icon: Icons.send_outlined,
                      color: colorScheme.primary,
                      onTap: () => controller.onCreateTask())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
