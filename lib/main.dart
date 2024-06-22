import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:polyphasic_sleep_new/models/sound_provider.dart';
import 'package:polyphasic_sleep_new/pages/alarm_page.dart';
import 'package:polyphasic_sleep_new/pages/all_schedules_page.dart';
import 'package:polyphasic_sleep_new/pages/current_schedule_page.dart';
import 'package:polyphasic_sleep_new/pages/home_page.dart';
import 'package:polyphasic_sleep_new/pages/how_it_works_page.dart';
import 'package:polyphasic_sleep_new/pages/settings_page.dart';
import 'package:polyphasic_sleep_new/pages/setup_page.dart';
import 'package:polyphasic_sleep_new/pages/sleep_quality_page.dart';
import 'package:polyphasic_sleep_new/pages/sound_playback_page.dart';
import 'package:polyphasic_sleep_new/pages/sounds_page.dart';
import 'package:polyphasic_sleep_new/pages/splash_screen/logo_page.dart';
import 'package:polyphasic_sleep_new/pages/splash_screen/quote_page.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SoundProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Polyphasic Sleep',
      home: const QuotePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/homepage': (context) => const HomePage(),
        '/currentschedulepage': (context) => const CurrentSchedulePage(),
        '/allschedulespage': (context) => const AllSchedulesPage(),
        '/alarmpage': (context) => const AlarmPage(),
        '/howitworkspage': (context) => const HowItWorksPage(),
        '/soundspage': (context) => const SoundsPage(),
        '/sleepqualitypage': (context) => const SleepQualityPage(),
        '/settingspage': (context) => const SettingsPage(),
        '/logopage': (context) => const LogoPage(),
        '/quotepage': (context) => const QuotePage(),
        '/setuppage': (context) => const SetupPage(),
        '/soundplaybackpage': (context) => const SoundPlaybackPage()
      },
    );
  }
}
