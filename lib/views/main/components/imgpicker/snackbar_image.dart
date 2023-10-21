import 'package:flutter/material.dart';

class MySnackBarImg {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.only(left: 50, bottom: 25, top: 25),
        content: Text(message, style: const TextStyle(color: Colors.black)),
        action: SnackBarAction(onPressed: () {}, label: 'OK'),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
