import 'package:flutter/material.dart';
class CircleContainer extends StatelessWidget {
  final Color? color;
  final bool isSelected;
  const CircleContainer({super.key, this.color, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: Colors.white, width: 5) : null,
      ),
    );
  }
}
