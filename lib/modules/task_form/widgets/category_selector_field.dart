import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/modules/task_form/controllers/task_form_controller.dart';
import 'package:uptodo/modules/task_form/widgets/action_icon.dart';

import 'category_item.dart';
import '../../../global_widgets/my_elevated_button.dart';

class CategorySelector extends GetView<TaskFormController> {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String displayString = "Select Category";
      displayString = controller.selectedCategory.value.name;
          return ActionIcon(
        icon: Icons.category_outlined,
        onTap: () => _onShowCategorySelector(context),
        tooltip: displayString,
      );
    });
  }

  void _onShowCategorySelector(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
              minWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Select Category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Divider(thickness: 1, height: 24),
                const SizedBox(height: 16),
                Expanded(
                  child: Obx(() {
                    if (controller.availableCategories.isEmpty) {
                      return const Center(
                        child: Text("No category available"),
                      );
                    }
                    return GridView.builder(
                      itemCount: controller.availableCategories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        final category = controller.availableCategories[index];
                        return CategoryItem(
                          title: category.name,
                          icon: category.icon ?? Icons.category_outlined,
                          backgroundColor: category.backgroundColor,
                          iconColor: category.iconColor,
                          onTap: () {
                            controller.onSelectCategory(category);
                            if (kDebugMode) {
                              print(
                                  "Selected category: ${controller.selectedCategory.value!.name}");
                            }
                          },
                        );
                      },
                    );
                  }),
                ),
                const SizedBox(height: 16),
                MyElevatedButton(
                  title: "Save",
                  onPressed: () {
                    Get.back();
                    controller.navigateToAddCategoryScreen();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
