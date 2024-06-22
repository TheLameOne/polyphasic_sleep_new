import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbarSchedule extends StatelessWidget {
  const BottomNavbarSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        tabs: const [
          GButton(
            icon: Icons.abc,
            text: "BIPHASIC",
          ),
          GButton(
            icon: Icons.abc,
            text: "BIPHASIC",
          ),
          GButton(
            icon: Icons.abc,
            text: "BIPHASIC",
          ),
        ]);
  }
}
