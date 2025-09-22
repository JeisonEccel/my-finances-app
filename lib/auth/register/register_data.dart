import 'package:flutter/cupertino.dart';
import 'package:my_finances_app/core/forms/form_data.dart';

class RegisterData extends FormData {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Map<String, dynamic> toJson() {
    return {'name': name.text, 'email': email.text, 'password': password.text};
  }
}
