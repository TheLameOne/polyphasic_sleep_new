import 'package:action_slider/action_slider.dart';
import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final _controller = ActionSliderController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<({int s, int e})> value = [
      (s: 120, e: 140),
      (s: 360, e: 380),
      (s: 600, e: 620),
      (s: 840, e: 860),
      (s: 1080, e: 1100),
      (s: 1320, e: 1410),
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.7,
              width: size.width - 4,
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PieChart(PieChartData(
                            startDegreeOffset: 263,
                            sectionsSpace: 0,
                            sections: _list(value))),
                      ),
                      PieChart(PieChartData(startDegreeOffset: 263, sections: [
                        for (int i = 0; i < 24; i++)
                          PieChartSectionData(
                              value: 100 / 24,
                              color: Colors.black54,
                              title: i.toString() + ":00",
                              titleStyle: TextStyle(fontSize: 12),
                              radius: 2,
                              titlePositionPercentageOffset: 10),
                      ]))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ActionSlider.standard(
                width: 300.0,
                action: (controller) async {
                  controller.loading(); //starts loading animation
                  await Future.delayed(const Duration(seconds: 1));
                  _stopAlarm();
                  controller.success(); //starts success animation
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset(); //resets the slider
                },
                direction: TextDirection.ltr,
                child: const Text('Stop Alarm #debug'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ActionSlider.standard(
                width: 300.0,
                action: (controller) async {
                  controller.loading(); //starts loading animation
                  await Future.delayed(const Duration(seconds: 1));
                  _setupAlarm();
                  controller.success(); //starts success animation
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset(); //resets the slider
                },
                direction: TextDirection.ltr,
                child: const Text('Setup Sleep Cycle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _stopAlarm() async {
  await Alarm.stop(1);
}

void _setupAlarm() async {
  await Alarm.set(
      alarmSettings: AlarmSettings(
          id: 1,
          dateTime: DateTime.now(),
          assetAudioPath: 'assets/alarm/alarm.mp3',
          notificationTitle: 'This is the title',
          notificationBody: 'This is the body'));
}

List<PieChartSectionData> _list(List<({int s, int e})> v) {
  int temp = 0;
  int e = 0;
  int s = v[0].s;
  List<({int s, int e})> value = v;
  List<int> list = [];
  while (value.isNotEmpty) {
    if (value[0].s - value[0].e > 0) {
      temp = 1440 - value[0].s;
      list.add(value[0].e);
      e = value[0].e;
      value.removeAt(0);
    }
    if (e != value[0].s) {
      list.add((value[0].s - e) * -1);
      e = value[0].s;
    } else {
      list.add(value[0].e - value[0].s);
      e = value[0].e;
      value.removeAt(0);
    }
  }
  if (temp != 0) {
    list.add((s - e) * -1);
    list.add(temp);
  }
  return _sections(list);
}

List<PieChartSectionData> _sections(List<int> list) {
  List<PieChartSectionData> sleep = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i] > 0) {
      sleep.add(PieChartSectionData(
          value: list[i].toDouble(),
          color: Colors.red,
          title: list[i].toString()));
    } else {
      sleep.add(PieChartSectionData(
          value: list[i].abs().toDouble(),
          color: Colors.black12,
          showTitle: false));
    }
  }
  return sleep;
}

// [
                        //   PieChartSectionData(
                        //     value: 360,
                        //     color: Colors.red,
                        //   ),
                        //   PieChartSectionData(
                        //       value: 480, color: Colors.black12),
                        //   PieChartSectionData(value: 20, color: Colors.red),
                        //   PieChartSectionData(
                        //       value: 580, color: Colors.black12),
                        // ]