import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  const TextIconButton(
      {required this.icon,
      required this.text,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: Colors.blue,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
