import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/helpers/messages.dart';
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

  bool _obscurePassword = true;

  void setConfig() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    String? secret = prefs.getString("accessSecret");

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

  Widget createSwap() {
    return IconButton(
      icon: Icon(
        // Based on passwordVisible state choose the icon
        _obscurePassword ? Icons.visibility : Icons.visibility_off,
        color: Theme.of(context).primaryColorDark,
      ),
      onPressed: () {
        // Update the state i.e. toogle the state of passwordVisible variable
        setState(() {
          _obscurePassword = !_obscurePassword;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: 'Escribe tu access Token',
                labelText: 'Access Token',
                suffixIcon: createSwap()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: TextFormField(
              controller: secretController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: 'Escribe tu access Secret',
                labelText: 'Access Secret',
                suffixIcon: createSwap()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                prefs.setString("accessToken", tokenController.text);
                prefs.setString("accessSecret", secretController.text);
                api.setTokens(tokenController.text, secretController.text);
                Messages.snackbar(context, "Guardado con éxito");
              },
              child: const Text('Guardar'),
            ),
          ),
        ],
      ),
    );
  }
}
