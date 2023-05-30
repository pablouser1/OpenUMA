import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/views/home.dart';

void main() {
  runApp(const App());
  api.setTokensFromConfig();
}

class App extends StatelessWidget {
  const App({super.key});

  // Application root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenUMA',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
