import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/models/notificacion.dart';

class NotificacionesPage extends StatefulWidget {
  const NotificacionesPage({super.key});

  @override
  NotificacionesPageState createState() {
    return NotificacionesPageState();
  }
}

class NotificacionesPageState extends State<NotificacionesPage> {
  late Future<List<Notificacion>> futureNotificaciones;

  @override
  void initState() {
    super.initState();
    futureNotificaciones = api.notificaciones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notificaciones"),
      ),
      body: FutureBuilder<List<Notificacion>> (
        future: futureNotificaciones,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].mensaje),
                  subtitle: Text(data[index].canalNombre),
                  trailing: data[index].leido ? const Icon(Icons.check) : null,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
