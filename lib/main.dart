import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/views/home.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() {
  api.setTokensFromConfig();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // Application root
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
          title: 'OpenUMA',
          theme: ThemeData(
            colorScheme: lightDynamic ?? const ColorScheme.light(),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkDynamic ?? const ColorScheme.dark(),
            useMaterial3: true,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
