import 'package:flutter/material.dart';

class Constants {
  static const emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const bgGreyColor = Color(0xffefefef);
  static const softBlue = Color(0xff6ba8de);
  static const greyish = Color(0xffb5b5b5);
  static const white = Color(0xffefefef);
  static const warmGrey = Color(0xff868686);
  static const greyishBrown = Color(0xff4d4d4d);
  static const whiteTwo = Color(0xffffffff);
  static const greyishTwo = Color(0xffb1b1b1);
  static const warmGreyTwo = Color(0xff8a8a8a);
  static const whiteThree = Color(0xffd8d8d8);
  static const paleSalmon = Color(0xffffb592);
  static const sepia = Color(0xff9b4e2b);
  static const red = Color(0xffef3b2c);
  static const dustyOrange = Color(0xffe37643);
  static const warmGreyThree = Color(0xff8b8b8b);
  static const pinkishGrey = Color(0xffbebebe);
  static const whiteFour = Color(0xfff3f3f3);
  static const pastelRed = Color(0xffe75a5a);
  static const lightTan = Color(0xfff9f2bd);
  static const lightPeach = Color(0xffffc4a8);
  static const whiteSix = Color(0xffd9d9d9);
  static const greyishBrownTwo = Color(0xff3b3b3b);
  static const softBlueTwo = Color(0xff7396eb);
  static const yellowTan = Color(0xffffd376);
  static const paleOliveGreen = Color(0xff88da75);
  static const blush = Color(0xffee7979);
  static const greyishFour = Color(0xffb7b6b6);
  static const darkPeachTwo = Color(0xffea6969);
  static const lightTanTwo = Color(0xfff9cfbd);
  static const blackThree = Color(0xff363636);
  static const greyishThree = Color(0xffa5a5a5);
  static const warmGreyFour = Color(0xff7d7d7d);
  static const lightMossGreen = Color(0xff92ce83);
  static const maize = Color(0xfff3bf63);
  static const blue = Color(0xff5663ff);
  static const darkPurple = Color(0xff222455);
  static const nardo = Color(0xff6e7faa);
  static const fillColor = Color.fromARGB(57, 255, 255, 255);
  static const fillColors = Color.fromARGB(0, 183, 190, 210);
  static const accentText = Color.fromARGB(255, 110, 127, 170);
  static const secondaryElement = Color.fromARGB(255, 86, 99, 255);
  static const headingText = Color.fromARGB(255, 34, 36, 85);
  static const mainColor = Color.fromRGBO(20, 131, 198, 1);
  static const indigo = Color(0xFF8A98BA);
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

isPortrait(context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

EdgeInsetsGeometry customPadding() {
  return const EdgeInsets.only(
    left: 16,
    right: 16,
    top: 20,
    bottom: 20,
  );
}
