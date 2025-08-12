import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final VoidCallback? onPressed;
  const MyButton({super.key, required this.title, this.backgroundColor, this.textColor, this.width, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(title,
          style: TextStyle(color: textColor ?? Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
