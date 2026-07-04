import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/custom_bottom_navigation.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  void _navigate(BuildContext context, int index) {
    const routes = ['/home', '/calendar', '/new-task', '/focus'];
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificacoes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.panel,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: const [
              _NotificationTile(text: 'Martin concluiu uma tarefa.'),
              _NotificationTile(text: 'A tarefa de hoje vence as 18:00.'),
              _NotificationTile(text: 'Nao se esqueça da reuniao diaria.'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: 0,
        onTap: (index) => _navigate(context, index),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.panelSoft,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.notifications_rounded, size: 16, color: AppColors.shellSoft),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: AppColors.textDark, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
