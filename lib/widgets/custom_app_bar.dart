import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String name;
  final VoidCallback? onNotificationTap;

  const CustomAppBar({
    super.key,
    required this.name,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.panel,
          child: Icon(Icons.person, color: AppColors.textDark),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Oi, $name',
                style: AppTextStyles.greeting,
              ),
              const Text(
                'Voce tem 4 tarefas para hoje',
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onNotificationTap,
          icon: const Icon(Icons.notifications_none_rounded),
          color: AppColors.textPrimary,
        ),
      ],
    );
  }
}