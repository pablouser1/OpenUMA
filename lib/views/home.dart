import 'package:flutter/material.dart';
import 'package:openuma/components/drawer.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/views/docencia.dart';
import 'package:openuma/views/parking.dart';

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
        children: <Widget>[
          UI.makeCard("Docencia", "Notas, matrícula, créditos...",
              const Icon(Icons.school),
              tap: () =>
                  Nav.push(context, const DocenciaPage(), requiresLogin: true)),
          UI.makeCard("Aparcamientos", "Activa las barreras de forma remota",
              const Icon(Icons.local_parking),
              tap: () =>
                  Nav.push(context, const ParkingPage(), requiresLogin: true)),
        ],
      ),
      drawer: const DrawerWidget(),
    );
  }
}
