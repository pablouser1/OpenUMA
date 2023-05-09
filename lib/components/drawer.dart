import 'package:flutter/material.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/views/settings.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              Nav.push(context, const SettingsPage());
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
  }
}
