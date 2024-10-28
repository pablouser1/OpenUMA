import 'dart:io';

import 'package:flutter/material.dart';
import 'package:openuma/components/drawer.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/views/docencia.dart';
import 'package:openuma/views/notificaciones.dart';
import 'package:openuma/views/parking.dart';
import 'package:openuma/views/qr.dart';

import '../helpers/ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OpenUMA"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UI.card("Docencia", "Notas, matrícula, créditos...",
              const Icon(Icons.school),
              tap: () =>
                  Nav.push(context, const DocenciaPage(), requiresLogin: true)),
          UI.card("Aparcamientos", "Activa las barreras de forma remota",
              const Icon(Icons.local_parking),
              tap: () =>
                  Nav.push(context, const ParkingPage(), requiresLogin: true)),
          UI.card(
            "Códigos QR",
            "Escanea códigos QR",
            const Icon(Icons.qr_code_scanner),
            tap: () {
              if (Platform.isAndroid || Platform.isIOS) {
                Nav.push(
                  context,
                  const QRPage(),
                  requiresLogin: true,
                );
                return;
              }

              UI.snackbar(context, "Sistema operativo no compatible");
            },
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Nav.push(
          context,
          const NotificacionesPage(),
          requiresLogin: true,
        ),
        child: const Icon(Icons.notifications),
      ),
    );
  }
}
