import 'package:flutter/material.dart';
import 'package:socket_chat/services/auth_service.dart';
import 'package:socket_chat/services/socket_services.dart';

class RegisterViewModel {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  // String? name, email, password;

  final SocketService socketService = SocketService();
  final AuthService authService = AuthService();

  // createUser() {
  //   authService.register(name ?? '', email ?? '', password ?? '');
  // }
}
