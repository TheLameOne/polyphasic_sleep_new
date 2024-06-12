import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/schedule_component.dart';

class AllSchedulesPage extends StatelessWidget {
  const AllSchedulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Schedules"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: [ScheduleComponent(), ScheduleComponent()],
          ),
        ),
      ),
    );
  }
}
