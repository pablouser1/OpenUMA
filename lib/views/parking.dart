import 'package:flutter/material.dart';
import 'package:openuma/models/state.dart';
import 'package:provider/provider.dart';

import '../components/drawer.dart';

class ParkingPage extends StatelessWidget {
  const ParkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Aparcamientos"),
            ),
            body: const Text("Parking"),
          );
        }
    );
  }
}
