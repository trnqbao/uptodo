import "package:flutter/material.dart";

class MyElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? radius;

  const MyElevatedButton({super.key, required this.title, required this.onPressed, this.color, this.textColor, this.width, this.radius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: textColor ?? Theme.of(context).colorScheme.onPrimary),),
      ),
    );
  }
}
