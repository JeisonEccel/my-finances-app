import 'package:my_finances_app/core/forms/form_data.dart';

class ValidationData extends FormData {
  String accessToken;
  String refreshToken;

  ValidationData({required this.accessToken, required this.refreshToken});

  @override
  void dispose() {
    // No resources to dispose
  }

  @override
  Map<String, dynamic> toJson() {
    return {'accessToken': accessToken, 'refreshToken': refreshToken};
  }
}
