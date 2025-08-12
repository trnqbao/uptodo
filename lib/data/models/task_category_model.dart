import 'package:flutter/material.dart';

class TaskCategory {
  int? id;
  String name;
  IconData? icon;
  Color? iconColor;
  Color? backgroundColor;

  TaskCategory({
    this.id,
    required this.name,
    this.icon,
    this.iconColor,
    this.backgroundColor,
  });

  factory TaskCategory.fromMap(Map<String, dynamic> map) {
    return TaskCategory(
      id: map['id'],
      name: map['name'],
      icon: map['icon'],
      iconColor: map['iconColor'],
      backgroundColor: map['backgroundColor'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'iconColor': iconColor,
      'backgroundColor': backgroundColor,
    };
  }
}
