import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:socket_chat/models/user_model.dart';

import '../../core/app/base/base_user_response.dart';
import '../../services/auth_service.dart';

class UserViewModel {
  Future<List<UserModel>> getUsers() async {
    final token = await AuthService.getToken();
    try {
      final response = await http.get(
        Uri.parse(
            '${Platform.isAndroid ? 'http://10.0.2.2:3000/api' : 'http://localhost:3000/api'}/users'),
        headers: {
          'Content-Type': 'application/json',
          'x-token': token!,
        },
      );
      final userResponse = usersResponseFromJson(response.body);
      return userResponse;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
