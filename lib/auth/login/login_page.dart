import 'package:flutter/material.dart';
import 'package:my_finances_app/auth/login/login_data.dart';
import 'package:my_finances_app/core/forms/form.dart';
import 'package:my_finances_app/core/forms/form_button.dart';
import 'package:my_finances_app/core/forms/form_password_field.dart';
import 'package:my_finances_app/core/forms/form_text_field.dart';
import 'package:my_finances_app/core/forms/form_gap.dart';
import 'package:my_finances_app/core/forms/form_title.dart';

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
          FormButton(text: 'Login', onPressed: login(loginData)),
        ],
      ),
    );
  }
}

VoidCallback login(LoginData loginData) {
  return () {
    // TODO: Implement login logic
    print(
      'Login with ${loginData.username.text} and ${loginData.password.text}',
    );
  };
}
