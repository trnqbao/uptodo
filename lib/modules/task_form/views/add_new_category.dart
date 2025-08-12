import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/core/base/base_container.dart';
import 'package:uptodo/global_widgets/my_button.dart';
import 'package:uptodo/global_widgets/my_text_field.dart';
import 'package:uptodo/modules/task_form/controllers/task_form_controller.dart';
import 'package:uptodo/modules/task_form/widgets/circle_container.dart';

import '../../../global_widgets/my_elevated_button.dart';

class AddNewCategory extends GetView<TaskFormController> {
  const AddNewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Category"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                    Text(
                      "Category name:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      hintText: "Category name",
                      controller: controller.categoryController,
                      focusColor: Colors.grey,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Text(
                      "Category icon:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BaseContainer(title: "Choose icon from library"),
                    const SizedBox(
                      height: 30,
                    ),

                    Text(
                      "Category color:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //to-do: show color picker with default color(theme primary)
                    SizedBox(
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.availableColors.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.onSelectColor(
                                      controller.availableColors[index]);
                                  print("Color selected: $index");
                                },
                                child: Obx(() => CircleContainer(
                                      color: controller.availableColors[index],
                                      isSelected:
                                          controller.selectedColor.value ==
                                              controller.availableColors[index],
                                    )),
                              );
                            })),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: MyElevatedButton(
                        title: "Cancel",
                        onPressed: () => Get.back(),
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: MyElevatedButton(
                        title: "Save",
                        onPressed: () => Get.back(),
                      )),
                    ],
                  ),
                )
              ]),
        ));
  }
}
