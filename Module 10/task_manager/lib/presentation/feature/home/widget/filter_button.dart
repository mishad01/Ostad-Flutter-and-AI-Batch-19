import 'package:flutter/material.dart';
import 'package:task_manager/core/app_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: .circular(100),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        alignment: .center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: .w600,
            color: isSelected ? AppColors.white : AppColors.bodyText,
          ),
        ),
      ),
    );
  }
}
