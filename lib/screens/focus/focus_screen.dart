import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../../widgets/purple_button.dart';

class FocusScreen extends StatelessWidget {
  const FocusScreen({super.key});

  void _navigate(BuildContext context, int index) {
    const routes = ['/home', '/calendar', '/new-task', '/focus'];
    if (index == 3) return;
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foco'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const Text('Hora do Foco ', style: AppTextStyles.body),
                    const Spacer(),
                    const Icon(Icons.timer_outlined, size: 72, color: AppColors.panelSoft),
                    const SizedBox(height: 12),
                    const Text(
                      '25:00',
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    PurpleButton(text: 'Comecar', onPressed: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: 3,
        onTap: (index) => _navigate(context, index),
      ),
    );
  }
}
