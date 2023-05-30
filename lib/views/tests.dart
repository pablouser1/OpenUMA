import 'package:flutter/material.dart';

class TestsPage extends StatelessWidget {
  const TestsPage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("OpenUMA"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: TextButton(
                child: const Text("Hi"),
                onPressed: () {
                },
              ),
            )
          ],
        ),
      );
  }
}
