import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/views/home.dart';

void main() {
  api.setTokensFromConfig();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // Application root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenUMA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
