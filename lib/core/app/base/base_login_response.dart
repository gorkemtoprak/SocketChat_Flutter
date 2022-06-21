import 'dart:convert';

import 'package:socket_chat/models/user_model.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  UserModel user;
  String token;
  LoginResponse({
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: UserModel.fromJson(json['user']),
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'token': token,
      };
}
