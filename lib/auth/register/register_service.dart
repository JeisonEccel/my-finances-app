import 'package:my_finances_app/auth/register/register_data.dart';
import 'package:my_finances_app/requests/api_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService {
  Future<void> register(RegisterData registerData) async {
    final response = await ApiRequest.post('/auth/register', registerData);
    await storeTokens(response);
  }

  Future<void> storeTokens(Map<String, dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', response['accessToken'] as String);
    await prefs.setString('refreshToken', response['refreshToken'] as String);
  }
}
