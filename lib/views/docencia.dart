import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/components/loading.dart';
import 'package:openuma/helpers/nav.dart';
import 'package:openuma/models/expediente.dart';
import 'package:openuma/views/expediente.dart';

class DocenciaPage extends StatefulWidget {
  const DocenciaPage({super.key});

  @override
  DocenciaPageState createState() {
    return DocenciaPageState();
  }
}

class DocenciaPageState extends State<DocenciaPage> {
  late Future<List<Expediente>> futureExpedientes;

  @override
  void initState() {
    super.initState();
    futureExpedientes = api.expedientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Docencia"),
      ),
      body: FutureBuilder<List<Expediente>> (
        future: futureExpedientes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].titulacion),
                  subtitle: Text(data[index].fechaApertura),
                  onTap: () => Nav.push(context, ExpedientePage(expediente: data[index]), requiresLogin: true),
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
