import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/components/drawer.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/views/docencia.dart';
import 'package:openuma/views/parking.dart';

import '../helpers/ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late Future<int> futureNotifs;

  @override
  void initState() {
    super.initState();
    if (api.isLoggedIn()) {
      futureNotifs = api.notifSinLeer();
    }
  }

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
      floatingActionButton: FloatingActionButton(
        child: FutureBuilder<int>(
          future: futureNotifs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return Column(
                children: [
                  Text(
                    "$data",
                    style: TextStyle(
                      color: data == 0 ? Colors.green : Colors.red,
                    ),
                  ),
                  const Icon(Icons.notifications),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Text("-");
          },
        ),
        onPressed: () {}
      ),
    );
  }
}
