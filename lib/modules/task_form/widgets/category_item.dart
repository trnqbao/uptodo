import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  const CategoryItem(
      {super.key,
      required this.title,
      required this.icon,
      this.backgroundColor,
      this.iconColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Icon(icon,
                  color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
                  size: 32)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2),
      ]),
    );
  }
}
