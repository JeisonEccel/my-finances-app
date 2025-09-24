import 'package:shared_preferences/shared_preferences.dart';

class LoggedUser {
  static final LoggedUser _instance = LoggedUser._internal();
  late final SharedPreferences _prefs;

  LoggedUser._internal();

  static LoggedUser get instance => _instance;

  static Future<void> init() async {
    _instance._prefs = await SharedPreferences.getInstance();
  }

  String? get accessToken => _prefs.getString('accessToken');
  String? get refreshToken => _prefs.getString('refreshToken');

  Future<void> setAccessToken(String token) async =>
      _prefs.setString('accessToken', token);

  Future<void> setRefreshToken(String token) async =>
      _prefs.setString('refreshToken', token);

  Future<void> clearTokens() async {
    await _prefs.remove('accessToken');
    await _prefs.remove('refreshToken');
  }
}
