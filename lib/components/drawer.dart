import 'package:flutter/material.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/models/state.dart';
import 'package:openuma/views/settings.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
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
            ListTile(
              title: const Text("Ajustes"),
              leading: const Icon(Icons.settings),
              onTap: () {
                Nav.push(context, const SettingsPage(), state);
              },
            ),
            const Divider(),
            const ListTile(
              title: Text('Código fuente'),
              leading: Icon(Icons.fork_left),
            ),
          ],
        ),
      );
    });
  }
}
