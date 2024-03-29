import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_chat/core/utils/constants.dart';
import 'package:socket_chat/models/message_model.dart';
import 'package:socket_chat/views/chat/widgets/message_widget.dart';

import '../../services/auth_service.dart';
import '../../services/chat_service.dart';
import '../../services/socket_services.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final List<MessageWidget> _messages = [];
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  late SocketService socketService = SocketService();
  late AuthService authService = AuthService();
  late ChatService chatService = ChatService();

  @override
  void initState() {
    super.initState();
    chatService = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketService>(context, listen: false);
    authService = Provider.of<AuthService>(context, listen: false);
    socketService.socket.on('send-message', listenMessage);
    getChatHistory(chatService.user.uid ?? '');
  }

  void listenMessage(dynamic data) {
    MessageWidget message = MessageWidget(
      text: data['message'],
      id: data['from'],
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void getChatHistory(String id) async {
    List<MessageModel> messages = await chatService.getChat(id);
    final chatHistory = messages.map(
      (e) => MessageWidget(
        text: e.message,
        id: e.fromMessage,
      ),
    );
    _messages.insertAll(0, chatHistory.toList());
    print(chatHistory);
  }

  @override
  Widget build(BuildContext context) {
    final userTo = chatService.user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.bgGreyColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              maxRadius: 18,
              child: Text(
                userTo.name!.substring(0, 2).toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              userTo.name ?? '',
              style: const TextStyle(
                color: Constants.blackThree,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Constants.bgGreyColor,
      body: Padding(
        padding: customPadding(),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return MessageWidget(
                    text: _messages[index].text,
                    id: authService.user.uid,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      onSaved: (value) {
                        _textController.text = value ?? '';
                      },
                      controller: _textController,
                      cursorColor: Constants.mainColor,
                      minLines: 1,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Please Enter Your Message',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(135, 132, 132, 0.7),
                        ),
                        prefixStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        contentPadding: EdgeInsets.only(
                          top: 15.0,
                          bottom: 15.0,
                          left: 10.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print(_textController.text);
                    sendMessage(_textController.text);
                  },
                  icon: const Icon(
                    Icons.send_sharp,
                    color: Constants.mainColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(String text) {
    if (text.isEmpty) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = MessageWidget(
      id: authService.user.uid,
      text: text,
    );
    _messages.insert(0, newMessage);

    socketService.emit('send-message', {
      'from': authService.user.uid,
      'to': chatService.user.uid,
      'message': text,
    });
  }

  @override
  void dispose() {
    socketService.socket.off('send-message');
    super.dispose();
  }
}
