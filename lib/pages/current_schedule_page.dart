import 'package:flutter/material.dart';

class CurrentSchedulePage extends StatelessWidget {
  const CurrentSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text("C U R R E N T      S C H E D U L E",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 20)),
        ),
      )),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: MaterialButton(
            child: const Text("Setup"),
            onPressed: () => Navigator.pushNamed(context, '/setuppage')),
      ),
    );
  }
}
