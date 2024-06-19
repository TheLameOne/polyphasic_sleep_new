import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polyphasic_sleep_new/models/schedules_model.dart';
import 'package:polyphasic_sleep_new/pages/schedule_types_page.dart';

class ScheduleComponent extends StatelessWidget {
  final String name;
  final List<ScheduleTypeModel> desc;

  const ScheduleComponent({super.key, required this.name, required this.desc});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ScheduleTypesPage()));
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
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 32),
                        ),
                        for (int i = 0; i < desc.length; i++)
                          Text(
                            desc[i].scheduleType!,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          )
                      ],
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.surface,
                      height: size.height * 0.3,
                      width: size.width * 0.3,
                      child: SvgPicture.asset("assets/svg/biphasic.svg",
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
    );
  }
}
