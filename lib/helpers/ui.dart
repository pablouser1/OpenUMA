import 'package:flutter/material.dart';

class UI {
  static Widget card(String title, String subtitle, Icon icon,
      {void Function()? tap}) {
    var col = Column(
      children: <Widget>[
        ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: icon,
        ),
      ],
    );
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      elevation: 5,
      child: tap == null ? col : InkWell(onTap: tap, child: col),
    );
  }

  static snackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> dialog(BuildContext context, String title, String body,
      {List<TextButton>? actions}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: actions,
        );
      },
    );
  }
}
