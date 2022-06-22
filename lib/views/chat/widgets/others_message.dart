import 'package:flutter/material.dart';

Widget othersMessage(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 10, right: 50, left: 5),
      decoration: BoxDecoration(
        color: const Color(0xffE4E5E8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    ),
  );
}
