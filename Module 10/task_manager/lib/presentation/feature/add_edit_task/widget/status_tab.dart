import 'package:flutter/material.dart';
import 'package:task_manager/core/app_colors.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.buttonActiveBg : AppColors.softGrey,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: isSelected ? AppColors.primaryText : AppColors.secondaryText,
        ),
      ),
    );
  }
}
