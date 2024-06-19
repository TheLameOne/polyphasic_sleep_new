import 'dart:convert';
import 'package:flutter/services.dart' as rootbundle;
import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/schedule_component.dart';
import 'package:polyphasic_sleep_new/models/schedules_model.dart';

class AllSchedulesPage extends StatelessWidget {
  const AllSchedulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text("S C H E D U L E S",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 20)),
        ),
      )),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder(
          future: readJsonData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      for (int i = 0; i < snapshot.data!.length; i++)
                        ScheduleComponent(
                          name: snapshot.data![i].scheduleName
                              .toString()
                              .toUpperCase(),
                          desc: snapshot.data![i].types!,
                        ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Future<List<ScheduleModel>> readJsonData() async {
  final jsondata =
      await rootbundle.rootBundle.loadString('json/schedules.json');
  // print(jsondata);
  final list = json.decode(jsondata) as List<dynamic>;
  List<ScheduleModel> res = [];
  for (var item in list) {
    res.add(ScheduleModel.fromJson(item));
  }
  return res;
  // return list.map((e) => DataModel.fromJson(e)).toList();
}
