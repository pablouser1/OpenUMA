import 'package:flutter/material.dart';
import 'package:openuma/models/state.dart';
import 'package:openuma/views/login.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      final bool loggedin = state.api.isLoggedIn();
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("OpenUMA"),
            ),
            loggedin ? ListTile(
              title: const Text("Perfil"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ) : ListTile(
              title: const Text("Iniciar sesión"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            )
          ],
        ),
      );
    });
  }
}
