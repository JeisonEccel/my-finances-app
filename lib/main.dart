import 'package:flutter/material.dart';
import 'package:my_finances_app/auth/login/login_page.dart';

void main() {
  runApp(MyFinancesApp());
}

class MyFinancesApp extends StatelessWidget {
  const MyFinancesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Finances App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
      ),
      home: LoginPage(),
    );
  }
}
