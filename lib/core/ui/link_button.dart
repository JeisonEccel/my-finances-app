import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({super.key, this.text, required this.onPressed});

  final String? text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text ?? '',
        style: TextStyle(fontSize: 16.0, color: Colors.blue[700]),
      ),
    );
  }
}
