import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';

class AllScheduleComponent extends StatelessWidget {
  const AllScheduleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, '/allschedulespage'),
        child: NeuBox(
          padding: false,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15)),
            height: size.height * 0.1,
            width: (size.width - 24) / 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text("S C H E D U L E S",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        fontSize: 20)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
