import 'package:flutter/material.dart';
import 'package:socket_chat/core/utils/constants.dart';

class LogoTitle extends StatelessWidget {
  final String? title;
  const LogoTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: 170,
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/logo.png'),
            ),
            const SizedBox(height: 10),
            Text(
              title ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Constants.blackThree,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
