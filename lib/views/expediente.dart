import 'package:flutter/material.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/models/expediente.dart';
import 'package:openuma/views/matricula.dart';
import 'package:openuma/views/notas.dart';

import '../helpers/ui.dart';

class ExpedientePage extends StatefulWidget {
  const ExpedientePage({super.key, required this.expediente});

  final Expediente expediente;

  @override
  ExpedientePageState createState() {
    return ExpedientePageState();
  }
}

class ExpedientePageState extends State<ExpedientePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expediente"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          UI.card(
            "Matrícula",
            "Asignaturas matrículadas en este curso académico",
            const Icon(Icons.menu_book),
            tap: () => Nav.push(
              context,
              const MatriculaPage(),
            ),
          ),
          UI.card(
            "Tablón de notas",
            "Notas publicadas de tus asignaturas matriculadas",
            const Icon(Icons.list),
            tap: () => Nav.push(
              context,
              NotasPage(expediente: widget.expediente),
              requiresLogin: true,
            ),
          ),
        ],
      ),
    );
  }
}
