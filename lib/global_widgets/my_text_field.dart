import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Color focusColor;
  final Color? backgroundColor;

  const MyTextField({super.key, required this.hintText, required this.controller, required this.focusColor, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: hintText,
        // isDense: true,
        filled: true,
        fillColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: focusColor,
              width: 0.5,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: backgroundColor ?? Theme.of(context).colorScheme.surface,
            width: 0.5,
          ),
        ),

      )
    );
  }
}
