import 'package:my_finances_app/auth/logged_user.dart';
import 'package:my_finances_app/auth/validation/validation_data.dart';
import 'package:my_finances_app/requests/api_request.dart';

class ValidateService {
  Future<bool> validateTokens() async {
    try {
      final accessToken = LoggedUser.instance.accessToken;
      final refreshToken = LoggedUser.instance.refreshToken;

      if (accessToken == null || refreshToken == null) {
        return false;
      }

      final ValidationData tokens = ValidationData(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      await validate(tokens);
      return true;
    } catch (e) {
      LoggedUser.instance.clearTokens();
      return false;
    }
  }

  Future<Map<String, dynamic>> validate(ValidationData validationData) async {
    return await ApiRequest.post('/auth/validate', validationData);
  }
}
