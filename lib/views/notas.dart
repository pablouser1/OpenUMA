import 'package:flutter/material.dart';
import 'package:openuma/models/expediente.dart';

import '../helpers/ui.dart';

class NotasPage extends StatefulWidget {
  const NotasPage({super.key, required this.expediente});

  final Expediente expediente;

  @override
  NotasPageState createState() {
    return NotasPageState();
  }
}

class NotasPageState extends State<NotasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notas"),
      ),
      body: const Text("En desarrollo")
    );
  }
}
