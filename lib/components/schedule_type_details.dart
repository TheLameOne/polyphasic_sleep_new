import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScheduleTypeDetails extends StatelessWidget {
  String scheduleType;
  String shortDescription;
  String totalSleep;
  String classification;
  double difficulty;
  String link;
  String idealScheduling;
  String svgPath;

  ScheduleTypeDetails({
    super.key,
    required this.scheduleType,
    required this.shortDescription,
    required this.totalSleep,
    required this.classification,
    required this.difficulty,
    required this.idealScheduling,
    required this.link,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Details
          Column(
            children: [
              Text(
                scheduleType,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 36),
              ),
              Text(
                "Some Text",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18),
              ),
              Text(
                "Some Text",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18),
              ),
              Text(
                "Some Text",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18),
              ),
              Text(
                "Some Text",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // PNG
          SizedBox(
            // color: Theme.of(context).colorScheme.surface,
            height: size.height * 0.3,
            width: size.width * 0.3,
            child: SvgPicture.asset("assets/svg/dark/Everyman2.svg",
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
    );
  }
}
