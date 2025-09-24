import 'package:flutter/material.dart';
import 'package:my_finances_app/core/forms/form_text_field.dart';

class FormPasswordField extends StatefulWidget {
  const FormPasswordField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.errorText,
  });

  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final String? errorText;

  @override
  State<FormPasswordField> createState() => _FormPasswordFieldState();
}

class _FormPasswordFieldState extends State<FormPasswordField> {
  @override
  Widget build(BuildContext context) {
    return FormTextField(
      controller: widget.controller,
      label: widget.label,
      hintText: widget.hintText,
      obscureText: true,
      errorText: widget.errorText,
    );
  }
}
