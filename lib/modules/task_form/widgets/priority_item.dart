import 'package:flutter/material.dart';

class PriorityItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isSelected;
  const PriorityItem({super.key, required this.title, this.icon, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final Color activeColor = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTap: onTap,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isSelected ? activeColor : Color(0xFF272727),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Icon(icon ?? Icons.flag_outlined, color: Theme.of(context).colorScheme.onPrimary, size: 25)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2),
      ]),
    );
  }
}
