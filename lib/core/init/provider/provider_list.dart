import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:socket_chat/core/init/provider/theme_notifier.dart';

import '../../../services/auth_service.dart';
import '../../../services/chat_service.dart';
import '../../../services/socket_services.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;

  static ApplicationProvider? get instance {
    _instance ??= ApplicationProvider._init();
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    ChangeNotifierProvider(create: (_) => AuthService()),
    ChangeNotifierProvider(create: (_) => SocketService()),
    ChangeNotifierProvider(create: (_) => ChatService()),
  ];
}
