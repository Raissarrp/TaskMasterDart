import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: AppColors.panelSoft,
        indicatorColor: AppColors.accent,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? AppColors.textPrimary : AppColors.shellSoft,
            size: 21,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontSize: 11,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: selected ? AppColors.textPrimary : AppColors.shellSoft,
          );
        }),
      ),
      child: NavigationBar(
        height: 62,
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Agenda',
          ),
          NavigationDestination(icon: Icon(Icons.add_rounded), label: 'Nova'),
          NavigationDestination(icon: Icon(Icons.timer_outlined), label: 'Foco'),
        ],
      ),
    );
  }
}