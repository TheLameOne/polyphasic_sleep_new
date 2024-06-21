import 'dart:convert';
import 'package:flutter/services.dart' as rootbundle;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:polyphasic_sleep_new/components/bottom_navbar_schedule.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';
import 'package:polyphasic_sleep_new/components/rotate_card_component.dart';
import 'package:polyphasic_sleep_new/components/schedule_component.dart';
import 'package:polyphasic_sleep_new/models/schedules_model.dart';
import 'package:polyphasic_sleep_new/pages/schedule_types_page.dart';
import 'package:polyphasic_sleep_new/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class AllSchedulesPage extends StatelessWidget {
  const AllSchedulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Container> cards = [
      Container(
        alignment: Alignment.center,
        child: NeuBox(
            padding: false,
            child: ScheduleComponent(
              name: "BIPHASIC",
              desc: [],
              svgPath: (Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode)
                  ? "assets/svg/dark/BiphasicSiesta.svg"
                  : "assets/svg/light/BiphasicSiesta.svg",
            )),
        // color: Colors.blue,
      ),
      Container(
        alignment: Alignment.center,
        child: NeuBox(
            padding: false,
            child: ScheduleComponent(
              name: "EVERYMAN",
              desc: [],
              svgPath: (Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode)
                  ? "assets/svg/dark/Everyman.svg"
                  : "assets/svg/light/Everyman.svg",
            )),
        // color: Colors.red,
      ),
      Container(
        alignment: Alignment.center,
        child: NeuBox(
            padding: false,
            child: ScheduleComponent(
              name: "DUAL CORE",
              desc: [],
              svgPath: (Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode)
                  ? "assets/svg/dark/Uberman.svg"
                  : "assets/svg/light/Uberman.svg",
            )),
        // color: Colors.purple,
      )
    ];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: const BottomNavbarSchedule(),
      //  Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Icon(Icons.arrow_back_ios_rounded),
      //     Text("BIPHASIC"),
      //     Icon(Icons.arrow_forward_ios_rounded),
      //   ],
      // ),
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
      body: Column(
        children: [
          Flexible(
            child: CardSwiper(
              cardsCount: 3,
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) =>
                      cards[index],
            ),
          ),
          Container(
            height: size.height * 0.15,
          )
        ],
      ),
      // body: FutureBuilder(
      //     future: readJsonData(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError) {
      //         return Center(child: Text(snapshot.error.toString()));
      //       } else if (snapshot.hasData) {
      //         return SingleChildScrollView(
      //           child: Padding(
      //             padding: EdgeInsets.only(top: 8),
      //             child: Column(
      //               children: [
      //                 for (int i = 0; i < snapshot.data!.length; i++)
      //                   ScheduleComponent(
      //                     name: snapshot.data![i].scheduleName
      //                         .toString()
      //                         .toUpperCase(),
      //                     desc: snapshot.data![i].types!,
      //                   ),
      //               ],
      //             ),
      //           ),
      //         );
      //       } else {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //     }),
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
