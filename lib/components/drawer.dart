import 'package:flutter/material.dart';
import 'package:openuma/constants/misc.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/views/settings.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: const Text(
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
              if (!await launchUrlString(
                repoUrl,
                mode: LaunchMode.externalApplication,
              )) {
                throw Exception('Could not launch $repoUrl');
              }
            },
          ),
          ListTile(
            title: const Text("Acerca de"),
            leading: const Icon(Icons.info),
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              if (!context.mounted) return;

              showAboutDialog(
                context: context,
                applicationName: packageInfo.appName,
                applicationVersion: packageInfo.version,
              );
            },
          ),
        ],
      ),
    );
  }
}
