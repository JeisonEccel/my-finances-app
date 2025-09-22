class LoginResponse {
  final String accessToken;
  final String refreshToken;

  LoginResponse({required this.accessToken, required this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'accessToken': final String token,
        'refreshToken': final String refreshToken,
      } =>
        LoginResponse(accessToken: token, refreshToken: refreshToken),
      _ => throw Exception('Invalid JSON format for LoginResponse'),
    };
  }
}
