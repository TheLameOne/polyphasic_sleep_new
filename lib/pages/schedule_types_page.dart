import 'package:flutter/material.dart';
import 'package:flutter_cards_reel/cards_reel_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:polyphasic_sleep_new/components/schedule_type_details.dart';

class ScheduleTypesPage extends StatefulWidget {
  const ScheduleTypesPage({super.key});

  @override
  State<ScheduleTypesPage> createState() => _ScheduleTypesPageState();
}

class _ScheduleTypesPageState extends State<ScheduleTypesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: CardsReelView(
            itemExtent: 400,
            itemHeaderExtent: 100,
            itemCount: 5,
            children: [
              ScheduleTypeDetails(),
              Container(
                height: size.height * 0.5,
                width: size.width,
                color: Colors.blue,
              ),
              Container(
                height: size.height * 0.5,
                width: size.width,
                color: Colors.green,
              ),
              Container(
                height: size.height * 0.5,
                width: size.width,
                color: Colors.yellow,
              ),
              Container(
                height: size.height * 0.5,
                width: size.width,
                color: Colors.black,
              )
            ]),
      ),
    );
  }
}
