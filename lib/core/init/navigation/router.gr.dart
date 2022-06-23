// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../../deneme/chat_view.dart' as _i3;
import '../../../views/loading/loading_view.dart' as _i4;
import '../../../views/login/login_view.dart' as _i2;
import '../../../views/register/register_view.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    Register.name: (routeData) {
      final args =
          routeData.argsAs<RegisterArgs>(orElse: () => const RegisterArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.RegisterView(key: args.key));
    },
    Login.name: (routeData) {
      final args = routeData.argsAs<LoginArgs>(orElse: () => const LoginArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginView(key: args.key));
    },
    Chat.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ChatView());
    },
    Loading.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoadingView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(Register.name, path: '/register'),
        _i5.RouteConfig(Login.name, path: '/login'),
        _i5.RouteConfig(Chat.name, path: '/chat'),
        _i5.RouteConfig(Loading.name, path: '/loading')
      ];
}

/// generated route for
/// [_i1.RegisterView]
class Register extends _i5.PageRouteInfo<RegisterArgs> {
  Register({_i6.Key? key})
      : super(Register.name, path: '/register', args: RegisterArgs(key: key));

  static const String name = 'Register';
}

class RegisterArgs {
  const RegisterArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'RegisterArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginView]
class Login extends _i5.PageRouteInfo<LoginArgs> {
  Login({_i6.Key? key})
      : super(Login.name, path: '/login', args: LoginArgs(key: key));

  static const String name = 'Login';
}

class LoginArgs {
  const LoginArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'LoginArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ChatView]
class Chat extends _i5.PageRouteInfo<void> {
  const Chat() : super(Chat.name, path: '/chat');

  static const String name = 'Chat';
}

/// generated route for
/// [_i4.LoadingView]
class Loading extends _i5.PageRouteInfo<void> {
  const Loading() : super(Loading.name, path: '/loading');

  static const String name = 'Loading';
}
