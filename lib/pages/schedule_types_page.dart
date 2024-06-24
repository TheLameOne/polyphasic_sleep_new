import 'dart:convert';
import 'package:flutter/services.dart' as rootbundle;
import 'package:flutter/material.dart';
import 'package:flutter_cards_reel/cards_reel_view.dart';
import 'package:polyphasic_sleep_new/components/schedule_type_details.dart';
import 'package:polyphasic_sleep_new/models/types_model.dart';

class ScheduleTypesPage extends StatefulWidget {
  final List<int> contains;
  const ScheduleTypesPage({super.key, required this.contains});

  @override
  State<ScheduleTypesPage> createState() => _ScheduleTypesPageState();
}

class _ScheduleTypesPageState extends State<ScheduleTypesPage> {
  Future<List<TypesModel>> readJsonData() async {
    final jsondata = await rootbundle.rootBundle.loadString('json/types.json');
    // print(jsondata);
    final list = json.decode(jsondata) as List<dynamic>;
    List<TypesModel> res = [];
    for (var item in list) {
      if (widget.contains.contains(item['id'])) {
        res.add(TypesModel.fromJson(item));
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
            future: readJsonData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                // for (int i = 0; i < snapshot.data!.length; i++) {
                //   print(snapshot.data![i].id);
                // }
                return Center(
                    child: CardsReelView(
                        itemExtent: 400,
                        itemHeaderExtent: 100,
                        itemCount: 5,
                        children: [
                      for (int i = 0; i < snapshot.data!.length; i++)
                        ScheduleTypeDetails(
                          classification:
                              snapshot.data![i].classification.toString(),
                          idealScheduling:
                              snapshot.data![i].idealScheduling.toString(),
                          link: snapshot.data![i].link.toString(),
                          scheduleType:
                              snapshot.data![i].scheduleType.toString(),
                          difficulty: snapshot.data![i].difficulty!.toDouble(),
                          shortDescription:
                              snapshot.data![i].shortDescription.toString(),
                          svgPath: snapshot.data![i].svg.toString(),
                          totalSleep: snapshot.data![i].totalSleep.toString(),
                        ),
                    ]));
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
