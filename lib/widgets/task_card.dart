import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String tag;
  final VoidCallback? onContinue;

  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.tag = 'Design',
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.panelSoft.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(tag, style: AppTextStyles.body),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: AppTextStyles.screenTitle,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.bottomRight,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.panelSoft,
                foregroundColor: AppColors.textDark,
                minimumSize: const Size(92, 34),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onContinue,
              child: const Text('Continuar'),
            ),
          ),
        ],
      ),
    );
  }
}