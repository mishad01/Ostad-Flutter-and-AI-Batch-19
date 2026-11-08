import 'package:flutter/material.dart';
import 'package:task_manager/core/app_colors.dart';
import 'package:task_manager/core/app_strings.dart';
import 'package:task_manager/presentation/core/square_icon_button.dart';
import 'package:task_manager/presentation/feature/add_edit_task/widget/field_label.dart';
import 'package:task_manager/presentation/feature/add_edit_task/widget/priority_button.dart';
import 'package:task_manager/presentation/feature/add_edit_task/widget/task_text_field.dart';

class AddEditTaskPage extends StatefulWidget {
  const new({super.key});

  @override
  State<AddEditTaskPage> createState() => _AddEditTaskPageState();
}

class _AddEditTaskPageState extends State<AddEditTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Add/Edit Task'),
        backgroundColor: AppColors.background,
        leading: SquareIconButton(
          icon: Icons.arrow_back,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FieldLabel(text: AppStrings.taskTitle),
            TaskTextField(
              controller: _titleController,
              hintText: AppStrings.taskTitleHint,
            ),
            FieldLabel(text: AppStrings.description),
            TaskTextField(
              controller: _descriptionController,
              hintText: AppStrings.description,
              maxLines: 4,
            ),
            FieldLabel(text: AppStrings.dueDate),

            Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(AppStrings.dueDate),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      // Implement date picker logic here
                    },
                  ),
                ],
              ),
            ),
            FieldLabel(text: AppStrings.priority),
            Row(
              spacing: 8,
              children: [
                PriorityButton(
                  label: AppStrings.low,
                  isSelected: false,
                  onTap: () {
                    // Handle low priority selection
                  },
                ),
                PriorityButton(
                  label: AppStrings.medium,
                  isSelected: false,
                  onTap: () {
                    // Handle medium priority selection
                  },
                ),
                PriorityButton(
                  label: AppStrings.high,
                  isSelected: false,
                  onTap: () {
                    // Handle high priority selection
                  },
                ),
              ],
            ),
            FieldLabel(text: AppStrings.status),

            // Add your form fields and buttons here
          ],
        ),
      ),
    );
  }
}
