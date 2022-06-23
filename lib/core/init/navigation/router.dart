import 'package:auto_route/auto_route.dart';
import 'package:socket_chat/views/chat/chat_view.dart';
import 'package:socket_chat/views/loading/loading_view.dart';
import 'package:socket_chat/views/login/login_view.dart';
import 'package:socket_chat/views/register/register_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: RegisterView,
      name: 'register',
      path: '/register',
    ),
    AutoRoute(
      page: LoginView,
      name: 'login',
      path: '/login',
    ),
    AutoRoute(
      page: ChatView,
      name: 'chat',
      path: '/chat',
    ),
    AutoRoute(
      page: LoadingView,
      name: 'loading',
      path: '/loading',
    ),
  ],
)
class $AppRouter {}
