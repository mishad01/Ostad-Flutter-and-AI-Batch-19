import 'package:flutter/material.dart';
import 'package:task_manager/core/app_colors.dart';
import 'package:task_manager/core/app_strings.dart';
import 'package:task_manager/presentation/core/square_icon_button.dart';
import 'package:task_manager/presentation/feature/add_edit_task/add_edit_task_page.dart';
import 'package:task_manager/presentation/feature/task_details.dart/widget/action_button.dart';
import 'package:task_manager/presentation/feature/task_details.dart/widget/info_pill.dart';
import 'package:task_manager/presentation/feature/task_details.dart/widget/info_row.dart';

class TaskDetailsPage extends StatefulWidget {
  const new({super.key});

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: SquareIconButton(
          icon: Icons.arrow_back,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Task Details'),
        actions: [
          SquareIconButton(
            icon: Icons.edit,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddEditTaskPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(32),
                    blurRadius: 4,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        InfoPill(
                          text: 'High Priority',
                          textColor: AppColors.red,
                          backgroundColor: AppColors.red.withAlpha(50),
                        ),
                        InfoPill(
                          text: 'Pending',
                          textColor: AppColors.primary,
                          backgroundColor: AppColors.primary.withAlpha(50),
                        ),
                      ],
                    ),

                    Text(
                      'Submit project report',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InfoRow(
                      icon: Icons.calendar_month,
                      label: "Due Date",
                      value: "2023-10-15",
                      valueColor: AppColors.red,
                    ),
                    InfoRow(
                      icon: Icons.lock_clock,
                      label: "Due Date",
                      value: "2023-10-15",
                      valueColor: AppColors.primaryText,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryText,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(32),
                    blurRadius: 4,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Text(
                'This is a detailed description of the task. It provides more information about what needs to be done, any specific requirements, and any other relevant details that will help in completing the task effectively.',
                style: TextStyle(fontSize: 14, color: AppColors.bodyText),
              ),
            ),

            ActionButton(
              icon: Icons.done,
              label: 'Mark as Completed',
              textColor: AppColors.primary,
              borderColor: AppColors.primary,
              backgroundColor: AppColors.primary,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddEditTaskPage()),
                );
              },
            ),
            ActionButton(
              icon: Icons.delete_outline,
              label: 'Delete Task',
              textColor: AppColors.red,
              borderColor: AppColors.red,
              backgroundColor: AppColors.red,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddEditTaskPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
