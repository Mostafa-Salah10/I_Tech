import 'package:flutter/material.dart';
import 'package:i_tech/core/themes/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color = AppColors.primaryColor,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      disabledColor: AppColors.primaryColor.withValues(alpha: 0.1),
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.lightBackgroundColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
