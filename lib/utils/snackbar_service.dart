import 'package:flutter/material.dart';
import 'package:chat_demo/main.dart';

class SnackBarService {
  static void show({
    required String message,
    Duration? duration,
  }) {
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

extension SnackBarExt on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
