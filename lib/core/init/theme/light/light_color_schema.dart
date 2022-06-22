import 'package:flutter/material.dart';
import 'package:socket_chat/core/utils/constants.dart';

class LightColorSchema {
  static LightColorSchema? _schema;

  static LightColorSchema? get schema {
    _schema ??= LightColorSchema._init();
    return _schema;
  }

  LightColorSchema._init();

  final Color mainColor = Constants.mainColor;
  final Color secondaryElement = Constants.secondaryElement;
  final Color warmGrey = const Color(0xff868686);
  final Color greyish = const Color(0xffa5a5a5);
  final Color indigo = const Color(0xFF8A98BA);
  final Color greyishBrown = const Color(0xff4d4d4d);
  final Color white = const Color(0xffffffff);
  final Color accentText = const Color.fromARGB(255, 110, 127, 170);
}
