import 'package:flutter/material.dart';
import 'package:my_finances_app/auth/login/login_page.dart';
import 'package:my_finances_app/auth/register/register_data.dart';
import 'package:my_finances_app/auth/register/register_service.dart';
import 'package:my_finances_app/core/forms/form.dart';
import 'package:my_finances_app/core/forms/form_button.dart';
import 'package:my_finances_app/core/forms/form_password_field.dart';
import 'package:my_finances_app/core/forms/form_text_field.dart';
import 'package:my_finances_app/core/forms/form_gap.dart';
import 'package:my_finances_app/core/forms/form_title.dart';
import 'package:my_finances_app/core/ui/link_button.dart';
import 'package:my_finances_app/pages/home/home_page.dart';
import 'package:my_finances_app/requests/api_error.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterData registerData = RegisterData();

  String? _generalError;
  String? _nameError;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    registerData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StyledForm(
        children: [
          FormTitle(title: 'Register to My Finances'),
          if (_generalError != null) ...[
            FormGap(),
            Text(_generalError!, style: const TextStyle(color: Colors.red)),
          ],
          FormGap(),
          FormTextField(
            label: 'Name',
            hintText: 'John Doe',
            controller: registerData.name,
            errorText: _nameError,
          ),
          FormGap(),
          FormTextField(
            label: 'Email',
            hintText: 'john@example.com',
            controller: registerData.email,
            errorText: _emailError,
          ),
          FormGap(),
          FormPasswordField(
            label: 'Password',
            hintText: '••••••••',
            controller: registerData.password,
            errorText: _passwordError,
          ),
          FormGap(),
          FormButton(text: 'Register', onPressed: _handleRegister),
          FormGap(),
          LinkButton(
            onPressed: _navigateToLogin,
            text: 'Already have an account? Login',
          ),
        ],
      ),
    );
  }

  Future<void> _handleRegister() async {
    try {
      await RegisterService().register(registerData);

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
            if (item.fieldName == 'name') {
              _nameError = item.message;
            } else if (item.fieldName == 'email') {
              _emailError = item.message;
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

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }
}
