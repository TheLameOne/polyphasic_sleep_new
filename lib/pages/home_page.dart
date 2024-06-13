// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text(
          "Polyphasic Sleep",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CurrentScheduleComponent(),
            SizedBox(height: 8),
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
