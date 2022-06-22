import 'package:flutter/material.dart';
import 'package:socket_chat/core/utils/constants.dart';

Widget myMessage(String text) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 10, left: 50, right: 5, top: 5),
      decoration: BoxDecoration(
        color: Constants.mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    ),
  );
}
