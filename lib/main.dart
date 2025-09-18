import 'package:flutter/material.dart';

void main() {
  runApp(MyFinancesApp());
}

class MyFinancesApp extends StatelessWidget {
  const MyFinancesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Finances App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
      ),
      home: Scaffold(body: Center(child: Text("My Finances App"))),
    );
  }
}
