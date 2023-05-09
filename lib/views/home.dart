import 'package:flutter/material.dart';
import 'package:openuma/components/drawer.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/views/docencia.dart';
import 'package:openuma/views/parking.dart';

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
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              elevation: 5,
              child: InkWell(
                onTap: () => Nav.push(context, const DocenciaPage(), requiresLogin: true),
                child: Column(
                  children: const <Widget>[
                    ListTile(
                      title: Text("Docencia"),
                      subtitle: Text('Notas, matrícula, créditos...'),
                      leading: Icon(Icons.school),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              elevation: 5,
              child: InkWell(
                onTap: () => Nav.push(context, const ParkingPage(), requiresLogin: true),
                child: Column(
                  children: const <Widget>[
                    ListTile(
                      title: Text("Aparcamientos"),
                      subtitle: Text('Activa las barreras de forma remota'),
                      leading: Icon(Icons.local_parking),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        drawer: const DrawerWidget(),
      );
  }
}
