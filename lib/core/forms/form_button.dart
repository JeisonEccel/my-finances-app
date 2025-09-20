import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({super.key, this.text, required this.onPressed});

  final String? text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(5.0)),
          ),
        ),
        child: Text(text ?? '', style: TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
