import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_chat/core/utils/constants.dart';
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
    chatService = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketService>(context, listen: false);
    authService = Provider.of<AuthService>(context, listen: false);
    // socketService.socket.on('send-message', listenMessage);
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.bgGreyColor,
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              maxRadius: 18,
              child: const Text(
                'GT',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              'Gorkem Toprak',
              style: TextStyle(
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
            const Expanded(
              child: MessageWidget(
                text: 'deneme deneme deneme 123',
                id: 'uuuu',
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
                      onSaved: (dynamic value) {
                        _textController.text = value;
                      },
                      controller: _textController,
                      cursorColor: Constants.blue,
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
                    color: Constants.secondaryElement,
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
      // id: authService.user.uid,
      id: '11221321312',
      text: text,
    );
    _messages.insert(0, newMessage);

    // socketService.emit('send-message', {
    //   'from': authService.user.uid,
    //   'to': chatService.user!.uid,
    //   'message': text,
    // });
  }

  @override
  void dispose() {
    socketService.socket.off('send-message');
    super.dispose();
  }
}
