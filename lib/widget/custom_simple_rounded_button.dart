import 'package:flutter/material.dart';

class CustomSimpleRoundedButtons extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomSimpleRoundedButtons(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Text(text),
      ),
    );
  }
}
