import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/task_form/controllers/task_form_controller.dart';
import 'package:uptodo/modules/task_form/widgets/action_icon.dart';
import 'package:uptodo/global_widgets/my_elevated_button.dart';
import 'package:uptodo/modules/task_form/widgets/priority_item.dart';

import '../../../core/enums/task_priority.dart';

class TaskPrioritySelector extends GetView<TaskFormController> {
  const TaskPrioritySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String displayString = "Select Priority";
      if (controller.selectedPriority.value != TaskPriority.none) {
        displayString = controller.selectedPriority.value.name;
      }
      return ActionIcon(
        icon: Icons.flag_outlined,
        onTap: () => _onShowPrioritySelector(context),
        tooltip: displayString,
      );
    });
  }

  void _onShowPrioritySelector(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Task Priority",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Divider(thickness: 0.5, height: 24),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: GridView.builder(
                    itemCount: TaskPriority.values.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Obx(() => PriorityItem(
                          title: TaskPriority.values[index].name,
                          onTap: () {
                            controller
                                .onSelectPriority(TaskPriority.values[index]);
                          },
                          isSelected: controller.selectedPriority.value ==
                              TaskPriority.values[index]));
                    },
                  ),
                ),
                const SizedBox(height: 16),
                MyElevatedButton(title: "Save", onPressed: () => Get.back()),
              ],
            ),
          ),
        );
      },
    );
  }
}
