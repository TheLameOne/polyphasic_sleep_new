import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';
import 'package:polyphasic_sleep_new/util/global.dart';

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
          padding: EdgeInsets.all(16.0),
          child: (!scheduleSelected)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "S E L E C T",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "S C H E D U L E",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "E V E R Y M A N 1",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, '/currentschedulepage'),
                                icon: Icon(
                                  Icons.settings,
                                  color: Theme.of(context).colorScheme.surface,
                                )),
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
