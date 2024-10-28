import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/components/loading.dart';
import 'package:openuma/models/expediente.dart';
import 'package:openuma/models/nota.dart';

class NotasPage extends StatefulWidget {
  const NotasPage({super.key, required this.expediente});

  final Expediente expediente;

  @override
  NotasPageState createState() {
    return NotasPageState();
  }
}

class NotasPageState extends State<NotasPage> {
  late Future<List<Nota>> futureNotas;
  int selectedValue = 0;

  @override
  void initState() {
    super.initState();
    futureNotas = api.notas(
        widget.expediente.numExpediente, widget.expediente.codExpediente);
  }

  List<DropdownMenuItem<int>> getMenuItems(List<Nota> notas) {
    return notas
        .asMap()
        .entries
        .map((entry) =>
            DropdownMenuItem(value: entry.key, child: Text(entry.value.curso)))
        .toList();
  }

  String fallbackEmpty(String nota) {
    if (nota == "") {
      return "--";
    }

    return nota;
  }

  ListTile buildNotaTile(Dato d) {
    return ListTile(
      leading: Text(d.esNotaParcial ? "Parcial" : "Final"),
      title: Text(d.nombre),
      subtitle: Text(
          "${d.esNotaParcial ? d.nombreCol! : d.calificacionAlfa!} / ${d.convocatoria}"),
      trailing: Text(
        fallbackEmpty(d.esNotaParcial ? d.nota! : d.calificacion!),
        style: d.tieneNota
            ? TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: d.aprobado == "si" ? Colors.green : Colors.red)
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notas"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder<List<Nota>>(
        future: futureNotas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            final menuItems = getMenuItems(data);

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton(
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  items: menuItems,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data[selectedValue].datos.length,
                    itemBuilder: (context, i) {
                      return buildNotaTile(data[selectedValue].datos[i]);
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}
