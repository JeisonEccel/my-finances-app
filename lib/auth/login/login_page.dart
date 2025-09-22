import 'package:flutter/material.dart';
import 'package:my_finances_app/auth/login/login_service.dart';
import 'package:my_finances_app/auth/login/login_data.dart';
import 'package:my_finances_app/core/forms/form.dart';
import 'package:my_finances_app/core/forms/form_button.dart';
import 'package:my_finances_app/core/forms/form_password_field.dart';
import 'package:my_finances_app/core/forms/form_text_field.dart';
import 'package:my_finances_app/core/forms/form_gap.dart';
import 'package:my_finances_app/core/forms/form_title.dart';
import 'package:my_finances_app/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginData loginData = LoginData();

  @override
  void dispose() {
    loginData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StyledForm(
        children: [
          FormTitle(title: 'My Finances '),
          FormGap(),
          FormTextField(
            label: 'Email',
            hintText: 'john@example.com',
            controller: loginData.username,
          ),
          FormGap(),
          FormPasswordField(
            label: 'Password',
            hintText: '••••••••',
            controller: loginData.password,
          ),
          FormGap(),
          FormButton(text: 'Login', onPressed: _handleLogin),
          // TODO: Add "Sign Up" button
        ],
      ),
    );
  }

  Future<void> _handleLogin() async {
    LoginService().login(loginData);

    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
