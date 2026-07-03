import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {

  final int currentIndex;

  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return NavigationBar(

      selectedIndex: currentIndex,

      onDestinationSelected: onTap,

      destinations: const [

        NavigationDestination(
          icon: Icon(Icons.home),
          label: "Home",
        ),

        NavigationDestination(
          icon: Icon(Icons.calendar_month),
          label: "Agenda",
        ),

        NavigationDestination(
          icon: Icon(Icons.add_circle_outline),
          label: "Nova",
        ),

        NavigationDestination(
          icon: Icon(Icons.timer),
          label: "Foco",
        ),

        NavigationDestination(
          icon: Icon(Icons.notifications),
          label: "Avisos",
        ),
      ],
    );
  }
}