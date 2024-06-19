import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SleepQualityPage extends StatelessWidget {
  const SleepQualityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text("S L E E P     Q U A L I T Y",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 20)),
        ),
      )),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  var box = await Hive.openBox('test1');
                  box.put('name', 'harsh');
                },
                icon: Icon(
                  Icons.home,
                  size: 64,
                )),
            IconButton(
                onPressed: () async {
                  var box = await Hive.openBox('test1');
                  // box.put('name', 'harsh');
                  print(box.get('name'));
                  print(box.name);
                },
                icon: Icon(
                  Icons.padding,
                  size: 64,
                )),
          ],
        ),
      ),
    );
  }
}
