import 'package:flutter/material.dart';
import 'package:my_finances_app/auth/logged_user.dart';
import 'package:my_finances_app/auth/login/login_page.dart';
import 'package:my_finances_app/auth/validation/validation_service.dart';
import 'package:my_finances_app/auth/splash_screen.dart';
import 'package:my_finances_app/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoggedUser.init();
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
      home: FutureBuilder(
        future: ValidateService().validateTokens(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SplashScreen();
          }

          return !!snapshot.data! ? HomePage() : LoginPage();
        },
      ),
    );
  }
}
