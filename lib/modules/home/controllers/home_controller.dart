import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/core/constants/app_strings.dart';
import 'package:uptodo/modules/focus/views/focus_view.dart';

import '../../../data/models/task_model.dart';
import '../../calendar/views/calendar_view.dart';
import '../../profile/views/profile_view.dart';
import '../../task_form/controllers/task_form_controller.dart';

class HomeController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxInt currentIndex = 0.obs;
  final RxBool isTaskCompleted = false.obs;
  final RxBool isAvailableTodayTask = false.obs;
  // final _taskController = Get.find<TaskFormController>();
  final RxList<Task> todayTasks = <Task>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // todayTasks.value = _taskController.todayTasks;
    // isAvailableTodayTask.value = _taskController.todayTasks.isNotEmpty;
  }

  final List<String> appBarTitles = const [
    AppStrings.home,
    AppStrings.calendar,
    AppStrings.focus,
    AppStrings.profile
  ];

  final List<Widget> pages = [
    Container(),
    CalendarView(),
    FocusView(),
    ProfileView()
  ];


  // to be updated
  bool get _isAvailableTodayTask => false;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void onChangeTaskStatus() {
    isTaskCompleted.value = !isTaskCompleted.value;
  }
}
