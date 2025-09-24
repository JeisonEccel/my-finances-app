import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({
    super.key,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.errorText,
  });

  final String? label;
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? errorText;

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
        errorText: widget.errorText,
      ),
      obscureText: widget.obscureText,
      controller: widget.controller,
    );
  }
}
