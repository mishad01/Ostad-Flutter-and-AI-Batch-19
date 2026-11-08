import 'package:flutter/material.dart';
import 'package:task_manager/core/app_colors.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hasError = false,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String hintText;
  final bool hasError;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final borderColor = hasError ? AppColors.red : AppColors.border;

    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        border: _outLine(AppColors.border),
        enabledBorder: _outLine(borderColor),
        focusedBorder: _outLine(AppColors.primary),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.mutedText,
        ),
      ),
    );
  }

  OutlineInputBorder _outLine(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide(color: color),
    );
  }
}
