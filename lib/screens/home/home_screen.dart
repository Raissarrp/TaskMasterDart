import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/task_store.dart';
import '../../models/task.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int currentIndex = 0;

  void _navigateFromBottom(int index) {
    const routes = ['/home', '/calendar', '/new-task', '/focus'];
    if (index == currentIndex) return;
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  String _buildSubtitle(Task task) {
    if (task.dueDate != null) {
      return '${DateFormat.Hm().format(task.dueDate!)} • ${DateFormat('dd/MM/yyyy').format(task.dueDate!)}';
    }
    return task.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: AnimatedBuilder(
            animation: TaskStore.instance,
            builder: (context, child) {
              final tasks = TaskStore.instance.tasks;
              final completed = tasks.where((task) => task.isCompleted).length;
              final pending = tasks.length - completed;
              final today = TaskStore.instance.tasksForDate(DateTime.now()).length;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    name: 'Raissa',
                    onNotificationTap: () {
                      Navigator.pushNamed(context, '/notification');
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text('Minhas tarefas', style: AppTextStyles.screenTitle),
                  const SizedBox(height: 12),
                  if (tasks.isEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'Ainda nao ha tarefas criadas. Use o botao abaixo para adicionar uma nova tarefa.',
                        style: AppTextStyles.body,
                      ),
                    )
                  else
                    Column(
                      children: tasks
                          .map(
                            (task) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: TaskCard(
                                title: task.title,
                                subtitle: _buildSubtitle(task),
                                tag: task.category,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  const SizedBox(height: 20),
                  const Text(
                    'Meu status',
                    style: AppTextStyles.screenTitle,
                  ),
                  const SizedBox(height: 14),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.45,
                    children: [
                      StatCard(
                        title: 'Concluidas',
                        value: completed.toString(),
                        color: const Color(0xFF5B3A88),
                        icon: Icons.check_rounded,
                      ),
                      StatCard(
                        title: 'Pendentes',
                        value: pending.toString(),
                        color: const Color(0xFF6A4798),
                        icon: Icons.schedule,
                      ),
                      StatCard(
                        title: 'Hoje',
                        value: today.toString(),
                        color: const Color(0xFF7C57A9),
                        icon: Icons.today,
                      ),
                      StatCard(
                        title: 'Projetos',
                        value: tasks.length.toString(),
                        color: const Color(0xFF8D67BA),
                        icon: Icons.folder_open,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: currentIndex,
        onTap: _navigateFromBottom,
      ),
    );
  }
}
