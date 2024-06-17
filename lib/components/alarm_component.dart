import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';

class AlarmComponent extends StatelessWidget {
  const AlarmComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, '/alarmpage'),
        child: NeuBox(
          padding: false,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15)),
            height: size.height * 0.2,
            width: (size.width - 24) / 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("A L A R M S",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            fontSize: 20)),
                    const SizedBox(height: 16),
                    Icon(
                      Icons.alarm,
                      size: 64,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      // weight: 1,
                    )
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
