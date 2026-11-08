import 'package:flutter/material.dart';
import 'package:task_manager/core/app_colors.dart';

class SquareIconButton extends StatelessWidget {
  const SquareIconButton({super.key, required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: AppColors.border),
        ),
        child: IconButton(icon: Icon(icon), onPressed: onTap),
      ),
    );
  }
}
