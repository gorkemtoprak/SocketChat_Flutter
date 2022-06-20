// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController messageController = TextEditingController();

  late IO.Socket socket;

  @override
  void initState() {
    socket = IO.io(
      'http://localhost:3000',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build(),
    );
    listenSocket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const MessageItem(
                  sendByMe: true,
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                cursorColor: Colors.purpleAccent,
                style: const TextStyle(color: Colors.white),
                controller: messageController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      sendMessage(messageController.text);
                    },
                    icon: const Icon(Icons.send_sharp),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String text) {
    var messageJSON = {
      'message': text,
      'sentByMe': socket.id,
    };
    socket.emit('message', messageJSON);
  }

  void listenSocket() {
    socket.on('message-receive', (data) {
      print(data);
    });
  }
}

class MessageItem extends StatelessWidget {
  final bool sendByMe;
  const MessageItem({
    Key? key,
    required this.sendByMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisSize: MainAxisSize.min,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Hello',
              style: TextStyle(
                color: sendByMe ? Colors.purpleAccent : Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
