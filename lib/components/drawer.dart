import 'package:flutter/material.dart';
import 'package:openuma/constants/misc.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/views/settings.dart';
import 'package:openuma/views/tests.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
            child: Text(
              "OpenUMA",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.end,
            ),
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
            title: const Text("Código fuente"),
            leading: const Icon(Icons.code),
            onTap: () async {
              if (!await launchUrlString(repoUrl,
                  mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $repoUrl');
              }
            },
          ),
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
