import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/auth_service.dart';
import 'my_message_widget.dart';
import 'others_message.dart';

class MessageWidget extends StatelessWidget {
  final String? text;
  final String? id;
  const MessageWidget({
    Key? key,
    this.text,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Container(
      child: id == authService.user.uid
          ? myMessage(text ?? '')
          : othersMessage(text ?? ''),
    );
  }
}
