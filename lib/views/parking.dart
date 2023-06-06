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

  void sendCode(Barrera barrera) {
    setState(() {
      _loadingId = barrera.id;
    });
    api.codigo(barrera.id, coords: barrera.coords).then((code) {
      final out =
          code == 200 ? "Éxito" : "Ha habido un error al abrir la barrera";
      UI.snackbar(context, out);
      setState(() {
        _loadingId = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aparcamientos"),
      ),
      body: ListView(
        children: [
          for (var parking in parkings)
            for (var barrera in parking.barreras)
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(8),
                elevation: 5,
                child: InkWell(
                  onTap: () => sendCode(barrera),
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
                      if (_loadingId == barrera.id)
                        const LinearProgressIndicator()
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
