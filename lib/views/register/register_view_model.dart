import 'package:flutter/material.dart';
import 'package:socket_chat/services/socket_services.dart';

class RegisterViewModel {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final SocketService socketService = SocketService();
}
