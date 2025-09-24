import 'package:flutter/material.dart';
import 'package:my_finances_app/core/forms/form.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({super.key, this.title = ''});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(StyledForm.padding),
      child: Text(
        title,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
