import 'package:flutter/material.dart';

class MyMarkdown extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  const MyMarkdown({super.key, required this.title, this.backgroundColor, this.textColor, this.iconColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: TextStyle(color: textColor ?? Colors.black, fontSize: 15),),
            const SizedBox(width: 5),
            Icon(Icons.arrow_drop_down, color: iconColor ?? Colors.black54),
          ],
        ),
      ),
    );
  }
}
