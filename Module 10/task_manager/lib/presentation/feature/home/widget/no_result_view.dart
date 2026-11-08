import 'package:flutter/material.dart';
import 'package:task_manager/core/app_colors.dart';
import 'package:task_manager/core/app_strings.dart';

/// Shown when there are tasks, but the chosen filter matched none of them.
class NoResultView extends StatelessWidget {
  const NoResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 56, left: 20, right: 20),
      child: Column(
        spacing: 10,
        children: [
          Icon(Icons.search_off, size: 42, color: AppColors.border),
          Text(
            AppStrings.noTasksFound,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.bodyText,
            ),
          ),
          Text(
            AppStrings.tryAnotherFilter,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}
