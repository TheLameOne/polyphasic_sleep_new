import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/schedule_component.dart';

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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: [ScheduleComponent(), ScheduleComponent()],
          ),
        ),
      ),
    );
  }
}
