import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:socket_chat/models/message_model.dart';
import 'package:socket_chat/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class ChatService extends ChangeNotifier {
  late UserModel? user;

  List<MessageModel> messagesResponseFromJson(String str) =>
      List<MessageModel>.from(
        json.decode(str).map((x) => MessageModel.fromJson(x)),
      );

  String messagesResponseToJson(List<MessageModel> data) => json.encode(
        List<dynamic>.from(data.map((x) => x.toJson())),
      );

  Future getChat(String userId) async {
    final token = await AuthService.getToken();

    final response = await http.get(
        Uri.parse(
            '${Platform.isAndroid ? 'http://10.0.2.2:3000/api' : 'http://localhost:3000/api'}/messages/$userId'),
        headers: {'Content-Type': 'application/json', 'x-token': token!});

    final messages = messagesResponseFromJson(response.body);

    return messages;
  }
}
