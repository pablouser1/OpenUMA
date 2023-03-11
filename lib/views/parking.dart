import 'package:flutter/material.dart';
import 'package:openuma/constants/parkings.dart';
import 'package:openuma/helpers/messages.dart';
import 'package:openuma/models/state.dart';
import 'package:provider/provider.dart';

class ParkingPage extends StatefulWidget {
  const ParkingPage({super.key});

  @override
  ParkingPageState createState() {
    return ParkingPageState();
  }
}

class ParkingPageState extends State<ParkingPage> {
  bool _loading = false;
  String _loadingId = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
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
                    onTap: () {
                      setState(() {
                        _loading = true;
                        _loadingId = barrera.id;
                      });
                      state.api
                          .codigo(barrera.id, barrera.lat, barrera.lon)
                          .then((code) {
                        final out = code == 200
                            ? "Éxito"
                            : "Ha habido un error al abrir la barrera";
                        Messages.snackbar(context, out);
                        setState(() {
                          _loading = false;
                          _loadingId = "";
                        });
                      });
                    },
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
                        if (_loading && _loadingId == barrera.id)
                          const LinearProgressIndicator()
                      ],
                    ),
                  ),
                ),
          ],
        ),
      );
    });
  }
}
