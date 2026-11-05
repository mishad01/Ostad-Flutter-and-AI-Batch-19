import 'package:flutter/material.dart';
import 'package:task_manager/core/app_colors.dart';
import 'package:task_manager/core/app_strings.dart';
import 'package:task_manager/core/task.dart';
import 'package:task_manager/presentation/feature/home/widget/app_logo.dart';
import 'package:task_manager/presentation/feature/home/widget/filter_button.dart';
import 'package:task_manager/presentation/feature/home/widget/stat_card.dart';
import 'package:task_manager/presentation/feature/home/widget/task_card.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 12,
            children: [
              AppLogo(),
              Text(
                AppStrings.appName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(32),
                borderRadius: .circular(20),
              ),
              child: Icon(Icons.search, color: AppColors.primary),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              AppStrings.goodMorning,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryText,
              ),
            ),
            Text(
              'Abir',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: StatCard(
                    icon: Icons.format_list_bulleted,
                    iconColor: AppColors.primary,
                    count: 0,
                    label: 'Total',
                  ),
                ),
                Expanded(
                  child: StatCard(
                    icon: Icons.schedule,
                    iconColor: AppColors.amberIcon,
                    count: 0,
                    label: 'Pending',
                  ),
                ),
                Expanded(
                  child: StatCard(
                    icon: Icons.check_circle_outline,
                    iconColor: AppColors.greenIcon,
                    count: 0,
                    label: 'Completed',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FilterButton(
                    label: 'All',
                    isSelected: true,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: FilterButton(
                    label: 'Pending',
                    isSelected: false,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: FilterButton(
                    label: 'Completed',
                    isSelected: false,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            TaskCard(
              task: Task(
                title: 'Finish onboarding flow mockups',
                description:
                    'Wrap up the new user onboarding screens for review.',
                dueDate: 'Nov 4',
                priority: 'High',
                createdDate: 'Oct 28, 2026',
              ),
              onTap: () {},
              onStatusTap: () {},
            ),
            TaskCard(
              task: Task(
                title: 'Finish onboarding flow mockups',
                description:
                    'Wrap up the new user onboarding screens for review.',
                dueDate: 'Nov 4',
                priority: 'High',
                createdDate: 'Oct 28, 2026',
              ),
              onTap: () {},
              onStatusTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
