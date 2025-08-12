import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
  final String? tooltip;

  const ActionIcon(
      {super.key,
      required this.icon,
      required this.onTap,
      this.color,
      this.tooltip});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Tooltip(
          message: tooltip ?? "",
          child: Icon(
            icon,
            color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
            size: 25,
          ),
        ),
      ),
    );
  }
}
