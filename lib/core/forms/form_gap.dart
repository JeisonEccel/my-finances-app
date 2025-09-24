import 'package:flutter/material.dart';
import 'package:my_finances_app/core/forms/form.dart';

class FormGap extends StatelessWidget {
  const FormGap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: StyledForm.gap);
  }
}
