import 'package:flutter/material.dart';

class DocenciaPage extends StatefulWidget {
  const DocenciaPage({super.key});

  @override
  DocenciaPageState createState() {
    return DocenciaPageState();
  }
}

class DocenciaPageState extends State<DocenciaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Docencia"),
      ),
      body: const Text("Hi"),
    );
  }
}
