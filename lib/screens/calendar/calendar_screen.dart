import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/task_store.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/custom_bottom_navigation.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  void _navigate(BuildContext context, int index) {
    const routes = ['/home', '/calendar', '/new-task', '/focus'];
    if (index == 1) return;
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  String _weekDayName(DateTime date) {
    return DateFormat.E('pt_BR').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final weekDays = List.generate(
      7,
      (index) => DateTime.now().add(Duration(days: index - 2)),
    );

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
        child: AnimatedBuilder(
          animation: TaskStore.instance,
          builder: (context, child) {
            final tasks = TaskStore.instance.tasksForDate(_selectedDate);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.MMMM('pt_BR').format(_selectedDate),
                      style: AppTextStyles.screenTitle,
                    ),
                    Text(
                      DateFormat('yyyy').format(_selectedDate),
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: weekDays
                      .map(
                        (day) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDate = day;
                            });
                          },
                          child: _DayPill(
                            day: DateFormat('d').format(day),
                            weekDay: _weekDayName(day),
                            selected: day.year == _selectedDate.year &&
                                day.month == _selectedDate.month &&
                                day.day == _selectedDate.day,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 20),
                const Text('Agenda', style: AppTextStyles.screenTitle),
                const SizedBox(height: 10),
                Expanded(
                  child: tasks.isEmpty
                      ? Center(
                          child: Text(
                            'Nenhuma tarefa para este dia.',
                            style: AppTextStyles.body,
                          ),
                        )
                      : ListView(
                          children: tasks
                              .map(
                                (task) => _AgendaTile(
                                  time: task.dueDate != null
                                      ? DateFormat.Hm().format(task.dueDate!)
                                      : '-',
                                  title: task.title,
                                  users: task.description,
                                ),
                              )
                              .toList(),
                        ),
                ),
              ],
            );
          },
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
      width: 46,
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
