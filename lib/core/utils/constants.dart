import 'package:flutter/material.dart';

class Constants {
  static const emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const bgGreyColor = Color(0xffefefef);
  static const softBlue = Color(0xff6ba8de);
  static const white = Color(0xffefefef);
  static const greyishBrown = Color(0xff4d4d4d);
  static const warmGreyTwo = Color(0xff8a8a8a);
  static const red = Color(0xffef3b2c);
  static const blackThree = Color(0xff363636);
  static const blue = Color(0xff5663ff);
  static const fillColor = Color.fromARGB(57, 255, 255, 255);
  static const accentText = Color.fromARGB(255, 110, 127, 170);
  static const secondaryElement = Color.fromARGB(255, 86, 99, 255);
  static const headingText = Color.fromARGB(255, 34, 36, 85);
  static const mainColor = Color.fromRGBO(20, 131, 198, 1);
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
