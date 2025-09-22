import 'package:my_finances_app/auth/login/login_data.dart';
import 'package:my_finances_app/auth/login/login_response.dart';
import 'package:my_finances_app/requests/api_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<LoginResponse> login(LoginData loginData) async {
    final response = await ApiRequest.post('/auth/login', loginData);
    return LoginResponse.fromJson(response);
  }

  Future<void> storeTokens(LoginResponse loginResponse) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', loginResponse.accessToken);
    await prefs.setString('refreshToken', loginResponse.refreshToken);
  }
}
