import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScheduleComponent extends StatelessWidget {
  const ScheduleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, '/schedulepage'),
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15)),
            // height: size.height * 0.1,
            // width: (size.width - 24),
            child: Card(
              color: Theme.of(context).colorScheme.surface,
              elevation: 0,
              child: SizedBox(
                height: size.height * 0.2,
                width: size.width,
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.black),
                //     borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Biphasic",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 32),
                          ),
                          Text(
                            "5-6.5 hrs of Sleep",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          )
                        ],
                      ),
                      Container(
                        color: Theme.of(context).colorScheme.surface,
                        height: size.height * 0.4,
                        width: size.width * 0.4,
                        child: SvgPicture.asset("assets/svg/moon.svg",
                            semanticsLabel: 'Acme Logo'),
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
            )),
      ),
    );
  }
}
