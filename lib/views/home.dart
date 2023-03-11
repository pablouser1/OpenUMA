import 'package:flutter/material.dart';
import 'package:openuma/components/drawer.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/models/state.dart';
import 'package:openuma/views/parking.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
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
              margin: const EdgeInsets.all(15),
              elevation: 10,
              child: InkWell(
                onTap: () => Nav.push(context, const ParkingPage(), state, requiresLogin: true),
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
    });
  }
}
