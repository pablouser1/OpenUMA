import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/components/loading.dart';
import 'package:openuma/helpers/ui.dart';
import 'package:openuma/models/matricula.dart';

class MatriculaPage extends StatefulWidget {
  const MatriculaPage({super.key});

  @override
  MatriculaPageState createState() {
    return MatriculaPageState();
  }
}

class MatriculaPageState extends State<MatriculaPage> {
  late Future<List<Matricula>> futureMatricula;

  @override
  void initState() {
    super.initState();
    futureMatricula = api.matricula();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matrícula"),
      ),
      body: FutureBuilder<List<Matricula>> (
        future: futureMatricula,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    data[index].grupo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(data[index].nombreAsig),
                  subtitle: Text("Titulación: ${data[index].titulacion}"),
                  onTap: () => UI.snackbar(context, "En construcción"), // TODO: Permitir ver detalles de la asignatura
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const LoadingWidget();
        },
      ),
    );
  }
}
