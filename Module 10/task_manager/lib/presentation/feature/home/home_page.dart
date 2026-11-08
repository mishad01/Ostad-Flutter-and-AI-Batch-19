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
  final List<Task> _tasks = demoTasks;

  String _selectedFilter = AppStrings.all;

  List<Task> get _visibleTasks {
    if (_selectedFilter == AppStrings.pending) {
      return _tasks.where((task) => task.isCompleted == false).toList();
    } else if (_selectedFilter == AppStrings.completed) {
      return _tasks.where((task) => task.isCompleted == true).toList();
    } else {
      return _tasks;
    }
  }

  int get _completedCount =>
      _tasks.where((task) => task.isCompleted == true).length;

  int get _pendingCount =>
      _tasks.where((task) => task.isCompleted == false).length;

  void _onFilterTap(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  void _onStatusTap(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  void _goToAddTask() {}
  void _goToDetails() {}

  @override
  Widget build(BuildContext context) {
    final List<Task> visibleTask = _visibleTasks;

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
                    count: _tasks.length,
                    label: 'Total',
                  ),
                ),
                Expanded(
                  child: StatCard(
                    icon: Icons.schedule,
                    iconColor: AppColors.amberIcon,
                    count: _pendingCount,
                    label: 'Pending',
                  ),
                ),
                Expanded(
                  child: StatCard(
                    icon: Icons.check_circle_outline,
                    iconColor: AppColors.greenIcon,
                    count: _completedCount,
                    label: 'Completed',
                  ),
                ),
              ],
            ),
            Row(
              spacing: 7,
              children: [
                Expanded(
                  child: FilterButton(
                    label: 'All',
                    isSelected: _selectedFilter == AppStrings.all,
                    onTap: () => _onFilterTap(AppStrings.all),
                  ),
                ),
                Expanded(
                  child: FilterButton(
                    label: 'Pending',
                    isSelected: _selectedFilter == AppStrings.pending,
                    onTap: () => _onFilterTap(AppStrings.pending),
                  ),
                ),
                Expanded(
                  child: FilterButton(
                    label: 'Completed',
                    isSelected: _selectedFilter == AppStrings.completed,
                    onTap: () => _onFilterTap(AppStrings.completed),
                  ),
                ),
              ],
            ),
            if (_tasks.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.tasks,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.labelText,
                    ),
                  ),
                  Text(
                    '${visibleTask.length} ${AppStrings.tasks}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.labelText,
                    ),
                  ),
                ],
              ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: visibleTask.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TaskCard(
                      task: visibleTask[index],
                      onTap: _goToDetails,
                      onStatusTap: () => _onStatusTap(visibleTask[index]),
                    ),
                  );
                },
              ),
            ),
            // TaskCard(
            //   task: Task(
            //     title: 'Finish onboarding flow mockups',
            //     description:
            //         'Wrap up the new user onboarding screens for review.',
            //     dueDate: 'Nov 4',
            //     priority: 'High',
            //     createdDate: 'Oct 28, 2026',
            //   ),
            //   onTap: () {},
            //   onStatusTap: () {},
            // ),
            // TaskCard(
            //   task: Task(
            //     title: 'Finish onboarding flow mockups',
            //     description:
            //         'Wrap up the new user onboarding screens for review.',
            //     dueDate: 'Nov 4',
            //     priority: 'High',
            //     createdDate: 'Oct 28, 2026',
            //   ),
            //   onTap: () {},
            //   onStatusTap: () {},
            // ),
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
