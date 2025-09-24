import 'package:flutter/material.dart';
import 'package:my_finances_app/auth/login/login_service.dart';
import 'package:my_finances_app/auth/login/login_data.dart';
import 'package:my_finances_app/auth/register/register_page.dart';
import 'package:my_finances_app/core/forms/form.dart';
import 'package:my_finances_app/core/forms/form_button.dart';
import 'package:my_finances_app/core/forms/form_password_field.dart';
import 'package:my_finances_app/core/forms/form_text_field.dart';
import 'package:my_finances_app/core/forms/form_gap.dart';
import 'package:my_finances_app/core/forms/form_title.dart';
import 'package:my_finances_app/core/pages/page_wrapper.dart';
import 'package:my_finances_app/core/ui/link_button.dart';
import 'package:my_finances_app/pages/home/home_page.dart';
import 'package:my_finances_app/requests/api_error.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginData loginData = LoginData();

  String? _generalError;
  String? _usernameError;
  String? _passwordError;

  @override
  void dispose() {
    loginData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: StyledForm(
        children: [
          FormTitle(title: 'My Finances '),
          if (_generalError != null) ...[
            FormGap(),
            Text(_generalError!, style: const TextStyle(color: Colors.red)),
          ],
          FormGap(),
          FormTextField(
            label: 'Email',
            hintText: 'john@example.com',
            controller: loginData.username,
            errorText: _usernameError,
          ),
          FormGap(),
          FormPasswordField(
            label: 'Password',
            hintText: '••••••••',
            controller: loginData.password,
            errorText: _passwordError,
          ),
          FormGap(),
          FormButton(text: 'Login', onPressed: _handleLogin),
          FormGap(),
          LinkButton(onPressed: _navigateToSignUp, text: 'Create an account'),
        ],
      ),
    );
  }

  Future<void> _handleLogin() async {
    try {
      await LoginService().login(loginData);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } on RequestError catch (err) {
      if (!mounted) return;

      setState(() {
        if (err.errors != null && err.errors!.isNotEmpty) {
          for (final item in err.errors!) {
            if (item.fieldName == 'username') {
              _usernameError = item.message;
            } else if (item.fieldName == 'password') {
              _passwordError = item.message;
            } else {
              _generalError = item.message;
            }
          }
        } else {
          _generalError = err.exceptionType ?? 'Unexpected error';
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _generalError = 'Unexpected error occurred';
      });
    }
  }

  void _navigateToSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => RegisterPage()),
    );
  }
}
