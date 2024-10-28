import 'dart:io';

import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/constants/parkings.dart';
import 'package:openuma/helpers/ui.dart';
import 'package:openuma/models/parking.dart';

class ParkingPage extends StatefulWidget {
  const ParkingPage({super.key});

  @override
  ParkingPageState createState() {
    return ParkingPageState();
  }
}

class ParkingPageState extends State<ParkingPage> {
  String _loadingId = "";

  List<Widget> _handleBarreras() {
    List<Widget> widgets = List.empty(
      growable: true,
    );

    for (final parking in parkings) {
      for (var barrera in parking.barreras) {
        widgets.add(
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(8),
            elevation: 5,
            child: InkWell(
              onTap: () => _sendCode(barrera),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(parking.name),
                    subtitle: Text(
                      barrera.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: const Icon(Icons.local_parking),
                  ),
                  if (_loadingId == barrera.id) const LinearProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      }
    }

    return widgets;
  }

  void _sendCode(Barrera barrera) async {
    setState(() {
      _loadingId = barrera.id;
    });

    try {
      final code = await api.codigo(
        barrera.id,
        coords: barrera.coords,
      );

      final out = code == 200 ? "Éxito" : "Error: HTTP $code";
      if (mounted) {
        UI.snackbar(context, out);
      }
    } on HttpException catch (e) {
      if (mounted) {
        UI.snackbar(context, "Error desconocido: ${e.toString()}");
      }
    }

    setState(() {
      _loadingId = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aparcamientos"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: _handleBarreras(),
      ),
    );
  }
}
