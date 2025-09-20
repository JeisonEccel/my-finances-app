import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({
    super.key,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.controller,
  });

  final String? label;
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(widget.label ?? ''),
        hintText: widget.hintText ?? '',
      ),
      obscureText: widget.obscureText,
      controller: widget.controller,
    );
  }
}
