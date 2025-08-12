import 'package:get/get.dart';
import 'package:uptodo/modules/task_form/controllers/task_form_controller.dart';

import '../../../data/repositories/category_repository.dart';
import '../../../data/repositories/task_repository.dart';

class TaskFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskRepository>(() => TaskRepository());
    Get.lazyPut<CategoryRepository>(() => CategoryRepository());
    Get.lazyPut<TaskFormController>(
        () => TaskFormController(),
    );
  }
}