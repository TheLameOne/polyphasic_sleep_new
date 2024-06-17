import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';

class CurrentScheduleComponent extends StatelessWidget {
  const CurrentScheduleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return NeuBox(
      padding: false,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15)),
        height: size.height * 0.2,
        width: size.width - 16,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Everyman 1",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, '/currentschedulepage'),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 8, bottom: 8),
                          child: Text(
                            "Setup",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
                width: size.width * 0.4,
                child: SvgPicture.asset(
                  "assets/svg/moon.svg",
                ),
                // PieChart(PieChartData(
                //     centerSpaceRadius: 40,
                //     startDegreeOffset: 263,
                //     sectionsSpace: 0,
                //     sections: _list(value))
                //     ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
