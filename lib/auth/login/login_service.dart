import 'package:my_finances_app/auth/login/login_data.dart';
import 'package:my_finances_app/requests/api_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<void> login(LoginData loginData) async {
    final response = await ApiRequest.post('/auth/login', loginData);
    await storeTokens(response);
  }

  Future<void> storeTokens(Map<String, dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', response['accessToken'] as String);
    await prefs.setString('refreshToken', response['refreshToken'] as String);
  }
}
