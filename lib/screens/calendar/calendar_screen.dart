import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/custom_bottom_navigation.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  void _navigate(BuildContext context, int index) {
    const routes = ['/home', '/calendar', '/new-task', '/focus'];
    if (index == 1) return;
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/notification'),
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Setembro', style: AppTextStyles.screenTitle),
                Text('Outubro', style: AppTextStyles.body),
              ],
            ),
            const SizedBox(height: 14),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _DayPill(day: '2', weekDay: 'Seg'),
                _DayPill(day: '3', weekDay: 'Ter', selected: true),
                _DayPill(day: '4', weekDay: 'Qua'),
                _DayPill(day: '5', weekDay: 'Qui'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Agenda', style: AppTextStyles.screenTitle),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  _AgendaTile(time: '08:00', title: 'Landing Page Design', users: '2 pessoas'),
                  _AgendaTile(time: '11:00', title: 'Daily', users: '4 pessoas'),
                  _AgendaTile(time: '14:00', title: 'Sprint review', users: '5 pessoas'),
                  _AgendaTile(time: '17:00', title: 'Release checklist', users: '1 pessoa'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: 1,
        onTap: (index) => _navigate(context, index),
      ),
    );
  }
}

class _DayPill extends StatelessWidget {
  const _DayPill({required this.day, required this.weekDay, this.selected = false});

  final String day;
  final String weekDay;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.panelSoft : AppColors.shell,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: selected ? AppColors.textDark : AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            weekDay,
            style: TextStyle(
              color: selected ? AppColors.textDark : AppColors.textMuted,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _AgendaTile extends StatelessWidget {
  const _AgendaTile({required this.time, required this.title, required this.users});

  final String time;
  final String title;
  final String users;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 52,
            child: Text(time, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(users, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
