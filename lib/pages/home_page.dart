import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/alarm_component.dart';
import 'package:polyphasic_sleep_new/components/all_schedule_component.dart';
import 'package:polyphasic_sleep_new/components/current_schedule_component.dart';
import 'package:polyphasic_sleep_new/components/how_it_works_component.dart';
import 'package:polyphasic_sleep_new/components/settings_component.dart';
import 'package:polyphasic_sleep_new/components/sleep_quality_component.dart';
import 'package:polyphasic_sleep_new/components/sound_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
          // elevation: 20,
          title: Center(
        child: Text("P O L Y P H A S I C      S L E E P",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
      )),
      // backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CurrentScheduleComponent(),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  children: [
                    // All Schedules
                    AllScheduleComponent(),

                    // How it Works
                    HowItWorksComponent(),

                    // Sleep Quality
                    SleepQualityComponent()
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    // Alarms
                    AlarmComponent(),

                    // Sounds
                    SoundComponent(),

                    // Settings
                    SettingsComponent(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
