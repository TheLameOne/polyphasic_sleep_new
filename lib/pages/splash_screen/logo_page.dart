import 'dart:async';
import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/quotepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[50],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage("assets/images/logo.png")),
          const SizedBox(height: 32),
          Text(
            "POLYPHASIC SLEEP",
            style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          )
        ],
      )),
    );
  }
}
