import 'package:my_finances_app/auth/logged_user.dart';
import 'package:my_finances_app/auth/register/register_data.dart';
import 'package:my_finances_app/requests/api_request.dart';

class RegisterService {
  Future<void> register(RegisterData registerData) async {
    final response = await ApiRequest.post('/auth/register', registerData);
    await storeTokens(response);
  }

  Future<void> storeTokens(Map<String, dynamic> response) async {
    LoggedUser.instance.setAccessToken(response['accessToken'] as String);
    LoggedUser.instance.setRefreshToken(response['refreshToken'] as String);
  }
}
