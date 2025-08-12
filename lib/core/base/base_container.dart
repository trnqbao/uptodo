import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  const BaseContainer({super.key, required this.title, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(13),
      child: Text(title, style: TextStyle(fontSize: 16, color: textColor ?? Theme.of(context).colorScheme.onSurface),),
    );
  }
}
