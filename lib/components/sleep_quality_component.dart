import 'package:flutter/material.dart';

class SleepQualityComponent extends StatelessWidget {
  const SleepQualityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, '/sleepqualitypage'),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(15)),
          height: size.height * 0.2,
          width: (size.width - 48) / 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sleep Quality",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Icon(Icons.circle_outlined,
                      size: 64,
                      color: Theme.of(context).colorScheme.inversePrimary)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
