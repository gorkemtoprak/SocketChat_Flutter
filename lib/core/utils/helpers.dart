import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';

Future<bool> checkInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('Internet Connection Available');
      return true;
    } else {
      print('No Internet Connection');
      await Fluttertoast.showToast(
          msg: 'Please Check Your Internet Connection!');
      return false;
    }
  } on SocketException catch (_) {
    print('No Internet Connection');
    await Fluttertoast.showToast(msg: 'Please Check Your Internet Connection!');
    return false;
  }
}
