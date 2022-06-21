import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:socket_chat/models/user_model.dart';

import '../core/app/base/base_login_response.dart';

class AuthService extends ChangeNotifier {
  final _secureStorage = const FlutterSecureStorage();
  late UserModel user;

  bool _isLoading = false;
  bool get isLoadingAuth => _isLoading;
  set isLoadingAuth(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    const secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future saveToken(String token) async {
    return await _secureStorage.write(key: 'token', value: token);
  }

  // Future deleteToken() async {
  //   return await _secureStorage.delete(key: 'token');
  // }

  Future register(String name, String email, String password) async {
    isLoadingAuth = true;

    final data = {'name': name, 'email': email, 'password': password};

    final response = await http.post(
        Uri.parse(
            '${Platform.isAndroid ? 'http://10.0.2.2:3000/api' : 'http://localhost:3000/api'}/users'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'});

    isLoadingAuth = false;

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      user = loginResponse.user;

      await saveToken(loginResponse.token);
      return true;
    } else {
      final respBody = jsonDecode(response.body);
      return respBody['error'];
    }
  }
}
