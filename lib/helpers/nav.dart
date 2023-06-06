import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/helpers/ui.dart';
import 'package:openuma/views/settings.dart';

class Nav {
  static void push(BuildContext context, Widget page, {bool requiresLogin = false}) {
    if (requiresLogin && !api.isLoggedIn()) {
      UI.snackbar(context, "Necesitas iniciar sesión");
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        ),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }
}
