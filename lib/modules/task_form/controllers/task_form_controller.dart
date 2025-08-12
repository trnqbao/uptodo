import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uptodo/core/enums/task_priority.dart';
import 'package:uptodo/data/repositories/category_repository.dart';
import 'package:uptodo/data/repositories/task_repository.dart';
import 'package:uptodo/modules/task_form/widgets/category_item.dart';
import 'package:uptodo/modules/task_form/widgets/category_selector_field.dart';

import '../../../data/models/task_category_model.dart';
import '../../../data/models/task_model.dart';
import '../views/add_new_category.dart';

class TaskFormController extends GetxController {
  // text controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  // task model
  final Rx<DateTime?> selectedDateTime = Rx<DateTime?>(null);
  final Rx<TaskCategory> selectedCategory =
      TaskCategory(name: "Select Category").obs;
  final Rx<TaskPriority> selectedPriority = TaskPriority.none.obs;

  final RxBool isCategoryDialog = false.obs;

  final List<Color> availableColors = [
    const Color(0xFFccff80),
    const Color(0xFFFF9680),
    const Color(0xFF80FFFF),
    const Color(0xFF80FFD9),
    const Color(0xFFFF80EB),
    const Color(0xFF80D1FF),
  ];

  final Rx<Color> selectedColor = const Color(0xFF80FFD1).obs;

  // updatable fields
  final RxBool isEditing = false.obs;
  Task? taskToEdit;
  final RxString title = "Add New ".obs;

  // date time formatters
  final DateFormat fullDateTimeFormat = DateFormat('dd/MM/yyyy HH:mm');
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  final DateFormat timeFormat = DateFormat('HH:mm');

  // repositories
  final TaskRepository _taskRepository = Get.find<TaskRepository>();
  final CategoryRepository _categoryRepository = Get.find<CategoryRepository>();

  // retrieved data
  final RxList<TaskCategory> availableCategories = <TaskCategory>[].obs;
  final RxList<Task> tasks = <Task>[].obs;

  final RxBool isLoading = true.obs;

  // focus nodes
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  final RxBool isTitleFocused = false.obs;
  final RxBool isDescriptionFocused = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is Task) {
      taskToEdit = Get.arguments as Task;
      isEditing.value = true;
      titleController.text = taskToEdit!.title;
      descriptionController.text = taskToEdit!.description ?? '';
      selectedDateTime.value = taskToEdit!.dueDateTime;
      selectedPriority.value = taskToEdit!.priority;
      selectedCategory.value = availableCategories
          .firstWhereOrNull((cat) => cat.id == taskToEdit!.categoryId)!;
      isLoading.value = false;
      selectedPriority.value = TaskPriority.none;
    }
    _loadCategories();
    // titleFocusNode.addListener(() {
    //   isTitleFocused.value = titleFocusNode.hasFocus;
    // });
    //
    // descriptionFocusNode.addListener(() {
    //   isDescriptionFocused.value = descriptionFocusNode.hasFocus;
    // });
    super.onInit();
    init();
  }

  void init() {
    _loadCategories();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final fetchedTasks = await _taskRepository.getTasks();
    tasks.assignAll(fetchedTasks);
  }

  Future<void> addNewTask(Task task) async {
    await _taskRepository.addTask(task);
    _loadTasks();
  }

  Future<void> _loadCategories() async {
    final fetchedCategories = await _categoryRepository.getCategories();
    availableCategories.assignAll(fetchedCategories);
    availableCategories.value = [
      TaskCategory(
        name: "Work",
        icon: Icons.work_outline,
        backgroundColor: Color(0xFFccff80),
        iconColor: Color(0xFF21A300),
      ),
      TaskCategory(
        name: "Personal",
        icon: Icons.person_outline,
        backgroundColor: Color(0xFFFF9680),
        iconColor: Color(0xFFA31D00),
      ),
      TaskCategory(
        name: "School",
        icon: Icons.school_outlined,
        backgroundColor: Color(0xFF80FFFF),
        iconColor: Color(0xFF00A3FF),
      ),
      TaskCategory(
        name: "Shopping",
        icon: Icons.shopping_cart_outlined,
        backgroundColor: Color(0xFF80FFD9),
        iconColor: Color(0xFF00A372),
      ),
      TaskCategory(
        name: "Health",
        icon: Icons.health_and_safety_outlined,
        backgroundColor: Color(0xFFFF80EB),
        iconColor: Color(0xFFA30089),
      ),
      TaskCategory(
          name: "Travel",
          icon: Icons.flight_takeoff_outlined,
          backgroundColor: Color(0xFF809CFF),
          iconColor: Color(0xFF0055A3)),
      TaskCategory(
          name: "Family",
          icon: Icons.family_restroom_outlined,
          backgroundColor: Color(0xFFFC80FF),
          iconColor: Color(0xFFA000A3)),
      TaskCategory(
          name: "Fitness",
          icon: Icons.fitness_center_outlined,
          backgroundColor: Color(0xFF80FFA3),
          iconColor: Color(0xFF00A3A3)),
      TaskCategory(
          name: "Music",
          icon: Icons.music_note_outlined,
          backgroundColor: Color(0xFF80D1FF),
          iconColor: Color(0xFF0069A3)),
      TaskCategory(
        name: "Movies",
        icon: Icons.movie_outlined,
        backgroundColor: Color(0xFFFFCC80),
        iconColor: Color(0xFFA36200),
      ),
    ];

    availableCategories.add(TaskCategory(
        name: "Add new",
        icon: Icons.add,
        backgroundColor: Color(0xFF80FFD1),
        iconColor: Color(0xFF00A369)));
  }

  void onSelectColor(Color color) {
    selectedColor.value = color;
  }

  void onSelectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime.value ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        initialTime:
            TimeOfDay.fromDateTime(selectedDateTime.value ?? DateTime.now()),
        context: context,
      );

      if (pickedTime != null) {
        DateTime selectedDateTime = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, pickedTime.hour, pickedTime.minute);
        this.selectedDateTime.value = selectedDateTime;
        // navigate to category selector
        isCategoryDialog.value = true;
      } else {
        selectedDateTime.value = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          selectedDateTime.value?.hour ?? 0,
          selectedDateTime.value?.minute ?? 0,
        );
      }
    }
  }

  void onSelectCategory(TaskCategory category) {
    if (category.name == "Add new") {
      navigateToAddCategoryScreen();
    } else {
      selectedCategory.value = category;
    }
    // Get.back();
  }

  void onSelectPriority(TaskPriority priority) {
    selectedPriority.value = priority;
    // Get.back();
  }

  void onSaveTask() async {
    if (titleController.text.isEmpty) {
      titleFocusNode.requestFocus();
      return;
    }
    if (isEditing.value) {
      onUpdateTask();
    } else {
      onCreateTask();
    }
    Get.back();
  }

  void onCreateTask() {
    final Task newTask = Task(
        title: titleController.text,
        description: descriptionController.text,
        dueDateTime: selectedDateTime.value!,
        categoryId: selectedCategory.value.id!,
        priority: selectedPriority.value,
        isCompleted: false);
    tasks.add(newTask);
    // await TaskService.createTask(newTask);
    Get.back();
    onClearForm();
    // onRefreshTasks();
    // onReloadHomeView();
  }

  void onUpdateTask() async {}

  void onDeleteTask() async {}

  @override
  void onClose() {
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void onClearForm() {
    titleController.clear();
    descriptionController.clear();
    selectedDateTime.value = null;
    selectedCategory.value = TaskCategory(name: "Select Category");
    selectedPriority.value = TaskPriority.none;
  }

  void onRefreshTasks() {
    tasks.clear();
  }

  void onReloadHomeView() {}

  void navigateToAddCategoryScreen() async {
    final newCategory = await Get.to(() => AddNewCategory());
    if (newCategory != null) {
      availableCategories.add(newCategory);
      onSelectCategory(newCategory);
    }
  }
}
