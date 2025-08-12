import 'package:get/get.dart';
import 'package:uptodo/modules/calendar/bindings/calendar_binding.dart';
import 'package:uptodo/modules/focus/views/focus_view.dart';
import 'package:uptodo/modules/home/bindings/home_binding.dart';
import 'package:uptodo/modules/home/views/home_view.dart';
import 'package:uptodo/modules/profile/bindings/profile_binding.dart';
import 'package:uptodo/modules/task_form/bindings/task_form_binding.dart';
import 'package:uptodo/routes/app_routes.dart';

import '../modules/calendar/views/calendar_view.dart';
import '../modules/focus/bindings/focus_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/task_form/views/task_form_view.dart';

class AppPages {
  static const initial = AppRoutes.home;
  static const defaultTransition = Transition.rightToLeft;

  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.calendar,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.focus,
      page: () => const FocusView(),
      binding: FocusBinding(),
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: defaultTransition,
    ),
    GetPage(
      name: AppRoutes.taskForm,
      page: () => const TaskFormView(),
      binding: TaskFormBinding(),
      fullscreenDialog: true,
    ),
  ];
}
