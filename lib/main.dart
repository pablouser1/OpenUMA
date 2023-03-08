import 'package:flutter/material.dart';
import 'package:openuma/models/state.dart';
import 'package:openuma/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<AppState>(
    create: (_) => AppState(),
    child: const App(),
  ));
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
