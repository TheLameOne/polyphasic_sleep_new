// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:polyphasic_sleep_new/components/schedule_component.dart';

// class RotateCard extends StatefulWidget {
//   const RotateCard({super.key});
//   @override
//   State<RotateCard> createState() => _RotateCardState();
// }

// class _RotateCardState extends State<RotateCard> {
//   double x = 0.00;
//   double y = 0.00;
//   double amplitude = 0.3;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Transform(
//       alignment: FractionalOffset.center,
//       transform: Matrix4.identity()
//         ..rotateX(x)
//         ..rotateY(y),
//       child: GestureDetector(
//         onPanUpdate: (value) {
//           if (y - value.delta.dx < 0) {
//             setState(() {
//               y = max(y - value.delta.dx / 100, -amplitude);
//             });
//           } else {
//             setState(() {
//               y = min(y - value.delta.dx / 100, amplitude);
//             });
//           }
//           if (x - value.delta.dy < 0) {
//             setState(() {
//               x = max(x - value.delta.dy / 100, -amplitude);
//             });
//           } else {
//             setState(() {
//               x = min(x - value.delta.dy / 100, amplitude);
//             });
//           }
//         },
//         child: const SizedBox(
//           height: 280,
//           width: double.infinity,
//           child: ScheduleComponent(
//             name: "BIPHASIC",
//             desc: [],
//             svgPath: "assets/svg/biphasic.svg",
//           ),
//           // decoration: const BoxDecoration(
//           //   image: DecorationImage(
//           //     image: NetworkImage(
//           //         'https://www.mastercard.fr/content/dam/public/mastercardcom/eu/fr/images/particuliers/A-chacun-sa-Carte/Detail-des-gammes-de-Carte/standard-credit-card.png'),
//           //     fit: BoxFit.cover,
//           //   ),
//           //   boxShadow: [
//           //     BoxShadow(color: Colors.black26, blurRadius: 28),
//           //   ],
//           // ),
//         ),
//       ),
//     ));
//   }
// }
