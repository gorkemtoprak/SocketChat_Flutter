// ignore_for_file: library_prefixes

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../core/enums/server_status_enums.dart';
import 'auth_service.dart';

class SocketService extends ChangeNotifier {
  late IO.Socket _socket;
  IO.Socket get socket => _socket;
  Function get emit => _socket.emit;

  Status _status = Status.connecting;
  Status get serverStatus => _status;

  void connect() async {
    final token = await AuthService.getToken();

    _socket = IO.io(
        Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {'x-token': token},
    });

    // You can also use this
    // _socket = IO.io(
    //   'http://localhost:3000',
    //   IO.OptionBuilder()
    //       .setTransports(['websocket'])
    //       .enableAutoConnect()
    //       .build(),
    // );

    _socket.onConnect((_) {
      _status = Status.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _status = Status.offline;
      notifyListeners();
    });
  }

  void disconnect() {
    _socket.disconnect();
  }
}
