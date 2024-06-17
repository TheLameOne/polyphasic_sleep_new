import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';

class HowItWorksComponent extends StatelessWidget {
  const HowItWorksComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, '/howitworkspage'),
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
                  children: [
                    Text("H O W",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            fontSize: 20)),
                    Text("I T",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            fontSize: 20)),
                    Text("W O R K S ?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            fontSize: 20)),
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
