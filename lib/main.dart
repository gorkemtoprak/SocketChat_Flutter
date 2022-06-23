import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_chat/views/chat/chat_view.dart';
import 'package:socket_chat/views/register/register_view.dart';

import 'core/init/provider/provider_list.dart';
import 'core/init/provider/theme_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance!.dependItems],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      home: const ChatView(),
    );
  }
}
