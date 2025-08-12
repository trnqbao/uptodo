import 'package:get/get.dart';
import '../../../data/repositories/category_repository.dart';
import '../../../data/repositories/task_repository.dart';
import '../../calendar/controllers/calendar_controller.dart';
import '../../focus/controllers/focus_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(),);
    Get.lazyPut<CalendarController>(() => CalendarController());
    Get.lazyPut<FocusController>(() => FocusController());

    Get.lazyPut<TaskRepository>(() => TaskRepository());
    Get.lazyPut<CategoryRepository>(() => CategoryRepository());
  }
}
