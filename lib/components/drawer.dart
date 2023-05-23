import 'package:flutter/material.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/views/settings.dart';
import 'package:openuma/views/tests.dart';

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
          ListTile(
            title: const Text("Tests"),
            leading: const Icon(Icons.construction),
            onTap: () {
              Nav.push(context, const TestsPage());
            },
          ),          
        ],
      ),
    );
  }
}
