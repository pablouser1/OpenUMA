import 'package:flutter/material.dart';
import 'package:openuma/helpers/messages.dart';
import 'package:openuma/models/state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  late SharedPreferences prefs;
  final tokenController = TextEditingController();
  final secretController = TextEditingController();

  void setConfig() async {
    prefs = await SharedPreferences.getInstance();
    String ?token = prefs.getString("accessToken");
    String ?secret = prefs.getString("accessSecret");

    if (token != null && secret != null) {
      tokenController.text = token;
      secretController.text = secret;
    }
  }

  @override
  void initState() {
    setConfig();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    tokenController.dispose();
    secretController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Ajustes"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: TextFormField(
                controller: tokenController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Escribe tu access Token',
                  labelText: 'Access Token',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: TextFormField(
                controller: secretController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Escribe tu access Secret',
                  labelText: 'Access Secret',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  prefs.setString("accessToken", tokenController.text);
                  prefs.setString("accessSecret", secretController.text);
                  state.api.setTokens(tokenController.text, secretController.text);
                  Messages.snackbar(context, "Guardado con éxito");
                },
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      );
    });
  }
}
