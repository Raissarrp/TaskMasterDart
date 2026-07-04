import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                name: 'Raissa',
                onNotificationTap: () {
                  Navigator.pushNamed(context, '/notification');
                },
              ),
              const SizedBox(height: 18),
              const TaskCard(
                title: 'Landing Page Design',
                subtitle: '9:00 AM - 11:00 AM',
                tag: 'Trabalho',
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
                children: const [
                  StatCard(
                    title: 'Concluidas',
                    value: '20',
                    color: Color(0xFF5B3A88),
                    icon: Icons.check_rounded,
                  ),
                  StatCard(
                    title: 'Pendentes',
                    value: '33',
                    color: Color(0xFF6A4798),
                    icon: Icons.schedule,
                  ),
                  StatCard(
                    title: 'Hoje',
                    value: '6',
                    color: Color(0xFF7C57A9),
                    icon: Icons.today,
                  ),
                  StatCard(
                    title: 'Projetos',
                    value: '38',
                    color: Color(0xFF8D67BA),
                    icon: Icons.folder_open,
                  ),
                ],
              ),
            ],
          ),
        ),      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: currentIndex,
        onTap: _navigateFromBottom,
      ),
    );
  }
}