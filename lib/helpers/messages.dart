import 'package:flutter/material.dart';

class Messages {
  static snackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
