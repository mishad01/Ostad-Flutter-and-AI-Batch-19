import 'package:flutter/material.dart';
import 'package:task_manager/core/app_colors.dart';

class AppLogo extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: .circular(8),
      ),
      child: Icon(Icons.check, color: AppColors.background, size: 13),
    );
  }
}
