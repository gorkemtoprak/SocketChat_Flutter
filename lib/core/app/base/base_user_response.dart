import 'dart:convert';

import 'package:socket_chat/models/user_model.dart';

List<UserModel> usersResponseFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String usersResponseToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
