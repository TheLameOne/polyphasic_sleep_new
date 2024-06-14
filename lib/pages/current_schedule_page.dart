import 'package:flutter/material.dart';

class CurrentSchedulePage extends StatelessWidget {
  const CurrentSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Schedule"),
      ),
      body: Center(
        child: MaterialButton(
            child: const Text("Setup"),
            onPressed: () => Navigator.pushNamed(context, '/setuppage')),
      ),
    );
  }
}
