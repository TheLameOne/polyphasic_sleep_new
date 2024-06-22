import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScheduleTypeDetails extends StatelessWidget {
  // String scheduleTypeName;
  // String duration;
  // String classification;
  // double difficulty;
  // String link;
  // String idealScheduling;
  // String svgPath;

  const ScheduleTypeDetails({super.key});

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
                "Siesta",
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
