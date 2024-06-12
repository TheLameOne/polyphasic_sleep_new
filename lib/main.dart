import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/pages/alarm_page.dart';
import 'package:polyphasic_sleep_new/pages/all_schedules_page.dart';
import 'package:polyphasic_sleep_new/pages/current_schedule_page.dart';
import 'package:polyphasic_sleep_new/pages/home_page.dart';
import 'package:polyphasic_sleep_new/pages/how_it_works_page.dart';
import 'package:polyphasic_sleep_new/pages/settings_page.dart';
import 'package:polyphasic_sleep_new/pages/sleep_quality_page.dart';
import 'package:polyphasic_sleep_new/pages/sounds_page.dart';
import 'package:polyphasic_sleep_new/theme/dark_mode.dart';
import 'package:polyphasic_sleep_new/theme/light_mode.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Polyphasic Sleep',
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/homepage': (context) => HomePage(),
        '/currentschedulepage': (context) => CurrentSchedulePage(),
        '/allschedulespage': (context) => AllSchedulesPage(),
        '/alarmpage': (context) => AlarmPage(),
        '/howitworkspage': (context) => HowItWorksPage(),
        '/soundspage': (context) => SoundsPage(),
        '/sleepqualitypage': (context) => SleepQualityPage(),
        '/settingspage': (context) => SettingsPage(),
      },
    );
  }
}
