import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';

class SleepQualityComponent extends StatelessWidget {
  const SleepQualityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, '/sleepqualitypage'),
        child: NeuBox(
          padding: false,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15)),
            height: size.height * 0.15,
            width: (size.width - 24) / 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("S L E E P",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                                fontSize: 20)),
                        Text("Q U A L I T Y",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                                fontSize: 20)),
                      ],
                    ),
                    // const SizedBox(height: 16),
                    // Icon(Icons.circle_outlined,
                    //     size: 40,
                    //     color: Theme.of(context).colorScheme.inversePrimary)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
