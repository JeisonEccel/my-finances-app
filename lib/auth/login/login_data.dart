import 'package:flutter/cupertino.dart';
import 'package:my_finances_app/core/forms/form_data.dart';

class LoginData extends FormData {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
  }
}
