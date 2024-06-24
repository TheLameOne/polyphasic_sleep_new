import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polyphasic_sleep_new/models/schedules_model.dart';
import 'package:polyphasic_sleep_new/pages/schedule_types_page.dart';

class ScheduleComponent extends StatelessWidget {
  final String name;
  final String desc;
  final String difficulty;
  final String totalSleep;
  final String svgPath;
  final String link;
  final List<int> contains;

  const ScheduleComponent(
      {super.key,
      required this.name,
      required this.desc,
      required this.difficulty,
      required this.totalSleep,
      required this.svgPath,
      required this.link,
      required this.contains});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScheduleTypesPage(contains: contains)));
      },
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
              height: size.height * 0.3,
              width: size.width,
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black),
              //     borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 32,
                          ),
                        ),
                        Container(
                          width: size.width * 0.5,
                          child: Text(
                            desc,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 12,
                                overflow: TextOverflow.clip),
                          ),
                        ),
                        Row(
                          children: [
                            Text("Difficulty : ",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 14,
                                    overflow: TextOverflow.clip)),
                            Text(difficulty,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 14,
                                    overflow: TextOverflow.clip)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Total Sleep : ",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 14,
                                    overflow: TextOverflow.clip)),
                            Text(totalSleep,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 14,
                                    overflow: TextOverflow.clip)),
                          ],
                        )
                      ],
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.surface,
                      height: size.height * 0.3,
                      width: size.width * 0.3,
                      child: SvgPicture.asset(
                        svgPath,
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
          )),
    );
  }
}
