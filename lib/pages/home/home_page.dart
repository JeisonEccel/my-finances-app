import 'package:flutter/material.dart';
import 'package:my_finances_app/core/pages/page_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(child: Center(child: Text('Welcome to My Finances!')));
  }
}
