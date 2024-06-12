import 'dart:async';
import 'package:flutter/material.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/homepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[50],
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Reach your full potential by sleeping more than once each day.",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
      )),
    );
  }
}
