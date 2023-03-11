import 'package:flutter/material.dart';
import 'package:openuma/helpers/messages.dart';
import 'package:openuma/models/state.dart';
import 'package:openuma/views/settings.dart';

class Nav {
  static void push(BuildContext context, Widget page, AppState state, {bool requiresLogin = false}) {
    if (requiresLogin && !state.api.isLoggedIn()) {
      Messages.snackbar(context, "Necesitas iniciar sesión");
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
