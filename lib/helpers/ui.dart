import 'package:flutter/material.dart';

class UI {
  static Widget makeCard(String title, String subtitle, Icon icon,
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
      child: tap == null ? col : InkWell(
        onTap: tap,
        child: col
      ),
    );
  }
}
