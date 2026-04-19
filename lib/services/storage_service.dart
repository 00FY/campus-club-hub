import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> saveLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }

  static Future<void> saveRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
  }
}