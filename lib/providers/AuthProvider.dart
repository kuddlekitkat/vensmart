import 'package:flutter/material.dart';
import 'package:testmanga/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  late String token;
  late ApiService apiService;

  AuthProvider() {
    init();
  }

  Future<void> init() async {
    this.token = await getToken();
    if (this.token.isNotEmpty) {
      this.isAuthenticated = true;
    }
    this.apiService = new ApiService(this.token);
    notifyListeners();
  }

  Future<void> register(String name, String email, String password,
      String passwordConfirm, String deviceName) async {
    try {
      final response = await apiService.register(
          name, email, password, passwordConfirm, deviceName);

      print('Successful Registration: ${response.toJson()}');

      setToken(response.data?.apiToken ?? '');
      this.isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      print('Jaycee: $e');
    }
  }

  Future<void> login(String email, String password, String deviceName) async {
    final response = await apiService.login(email, password, deviceName);

    print('Successful Login: ${response.toJson()}');

    setToken(response.data?.apiToken ?? '');
    this.isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logOut() async {
    setToken('');
    this.isAuthenticated = false;
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
