import 'package:flutter/material.dart';

class CurrentSchedulePage extends StatelessWidget {
  const CurrentSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Schedule"),
      ),
      body: Center(
        child: MaterialButton(
            child: Text("Setup"),
            onPressed: () => Navigator.pushNamed(context, '/setuppage')),
      ),
    );
  }
}
