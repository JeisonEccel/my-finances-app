import 'package:flutter/material.dart';

class StyledForm extends StatelessWidget {
  const StyledForm({super.key, this.children = const []});

  static const double padding = 20.0;
  static const double gap = 20.0;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(StyledForm.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
