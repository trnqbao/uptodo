import 'package:flutter/material.dart';
import 'package:uptodo/data/models/task_category_model.dart';
import 'package:uptodo/core/enums/task_priority.dart';

class MyCustomTile extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final String time;
  final TaskCategory categoryModel;
  final TaskPriority taskPriority;

  const MyCustomTile(
      {super.key,
      required this.taskTitle,
        required this.taskDescription,
      required this.time,
      required this.categoryModel,
      required this.taskPriority});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // check icon
          Icon(Icons.check_box_outline_blank),

          // task title & due time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(taskTitle, style: TextStyle(color: Colors.black, fontSize: 15),),
              const SizedBox(height: 5,),
              Text(time, style: TextStyle(color: Colors.grey.shade500, fontSize: 14),)
            ],
          ),

          // const SizedBox(width: 20,),

          // task category
          Container(
            decoration: BoxDecoration(
              color: categoryModel.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(categoryModel.icon, color: categoryModel.iconColor,),
                const SizedBox(width: 5,),
                Text(categoryModel.name),
              ],
            ),
          ),

          // task priority
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.flag_outlined),
                Text(taskPriority.name),
              ],
            ),
          )
        ],
      ),
    );
  }
}
