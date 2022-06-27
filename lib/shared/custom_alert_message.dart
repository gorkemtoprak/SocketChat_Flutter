import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

showAlert(BuildContext context, String title, String? subtitle) {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text(title),
        content: subtitle != null ? Text(subtitle) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        actions: [
          MaterialButton(
            elevation: 5,
            color: Colors.blue,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          )
        ],
      );
    },
  );
}
