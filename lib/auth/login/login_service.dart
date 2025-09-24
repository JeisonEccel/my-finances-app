import 'package:my_finances_app/auth/logged_user.dart';
import 'package:my_finances_app/auth/login/login_data.dart';
import 'package:my_finances_app/requests/api_request.dart';

class LoginService {
  Future<void> login(LoginData loginData) async {
    final response = await ApiRequest.post('/auth/login', loginData);
    await storeTokens(response);
  }

  Future<void> storeTokens(Map<String, dynamic> response) async {
    LoggedUser.instance.setAccessToken(response['accessToken'] as String);
    LoggedUser.instance.setRefreshToken(response['refreshToken'] as String);
  }
}
