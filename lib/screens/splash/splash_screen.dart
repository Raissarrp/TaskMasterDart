import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/purple_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.shell, AppColors.shellSoft],
                ),
              ),
            ),
          ),
          Positioned(
            top: -40,
            left: -80,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.panelSoft.withValues(alpha: 0.35), width: 2),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.panelSoft,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Icon(Icons.task_alt_rounded, size: 86, color: AppColors.shell),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Organize suas\ntarefas diarias!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Bem-vindo ao TaskMaster',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 45),
                  PurpleButton(
                    text: 'Comecar',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}