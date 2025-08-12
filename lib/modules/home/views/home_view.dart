import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uptodo/data/models/task_category_model.dart';
import 'package:uptodo/core/enums/task_priority.dart';
import 'package:uptodo/global_widgets/my_bottom_navigation_bar.dart';
import 'package:uptodo/global_widgets/my_custom_tile.dart';
import 'package:uptodo/modules/home/controllers/home_controller.dart';
import 'package:uptodo/modules/task_form/bindings/task_form_binding.dart';
import 'package:uptodo/modules/task_form/views/task_form_view.dart';

import '../../../data/models/task_model.dart';
import '../widgets/app_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Obx(
        () {
          final int currentIndex = controller.currentIndex.value;
          final Widget currentBodyPage;
          if (currentIndex == 0) {
            currentBodyPage = _buildHomeTabContent(context); // Home
          } else {
            currentBodyPage = controller.pages[currentIndex];
          }

          return Scaffold(
            appBar: MyAppBar(title: controller.appBarTitles[currentIndex]),
            body: Container(
              color: colorScheme.background,
              child: currentBodyPage,
            ),
            bottomNavigationBar: MyBottomNavigationBar(
              currentIndex: currentIndex,
              onItemSelected: (index) => controller.changeTab(index),
            ),

            // circle add task button
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                TaskFormBinding().dependencies();
                Get.bottomSheet(
                  TaskFormView(),
                  isScrollControlled: true,
                  ignoreSafeArea: false,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                  ),
                  // backgroundColor: Colors.blue,
                );
              },
              shape: const CircleBorder(),
              backgroundColor: colorScheme.primary,
              child: Icon(Icons.add, color: colorScheme.onPrimary, size: 25,),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
        }
    );
  }

  Widget _buildHomeTabContent(BuildContext context) {
    final TaskCategory categoryModel = TaskCategory(name: "Work", icon: Icons.work_outline, backgroundColor: Color(0xFFccff80), iconColor: Color(0xFF21A300),);
    final TaskPriority taskPriority = TaskPriority.medium;
    return Obx(() {
      if (!controller.isAvailableTodayTask.value) {
        return Align(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                SvgPicture.asset("assets/images/checklist.svg"),
                Text("What do you want to do today?", style: TextStyle(fontSize: 20),),
                const SizedBox(height: 10,),
                Text("Tap + to add your tasks", style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
        );
      }
      return SingleChildScrollView(
        child: ListView.builder(
          itemCount: controller.todayTasks.length,
            itemBuilder: (context, index) {
              final Task task = controller.todayTasks[index];
              return MyCustomTile(
                taskTitle: task.title,
                taskDescription: task.description!,
                time: task.dueDateTime.toString(),
                categoryModel: categoryModel,
                taskPriority: taskPriority,
              );
            }),
      );
    }) ;
  }
}