import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).viewInsets.bottom,
            ),
            child: IntrinsicHeight(child: child),
          ),
        ),
      ),
    );
  }
}
