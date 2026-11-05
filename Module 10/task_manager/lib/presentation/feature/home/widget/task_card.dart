import 'package:flutter/material.dart';
import 'package:task_manager/core/app_colors.dart';
import 'package:task_manager/core/app_strings.dart';
import 'package:task_manager/core/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onTap,
    required this.onStatusTap,
  });
  final Task task;
  final VoidCallback onTap;
  final VoidCallback onStatusTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: .circular(18),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: .circular(18),
              boxShadow: AppColors.cardShadow,
            ),
            child: Icon(
              Icons.flag_circle_outlined,
              size: 20,
              color: AppColors.amber,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  task.description,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: .w700,
                    color: AppColors.mutedText,
                  ),
                ),
                Text(
                  task.title,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: .w700,
                    color: task.isCompleted
                        ? AppColors.mutedText
                        : AppColors.primaryText,
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                Row(
                  spacing: 6,
                  children: [
                    Icon(Icons.schedule, size: 13, color: AppColors.labelText),
                    Text(
                      task.priority,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: .w700,
                        color: AppColors.priorityText(task.priority),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: .symmetric(horizontal: 11, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: .circular(100),
            ),
            child: Text(
              task.isCompleted ? AppStrings.done : AppStrings.pending,
              style: TextStyle(
                fontSize: 11,
                fontWeight: .w700,
                color: task.isCompleted ? AppColors.green : AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
