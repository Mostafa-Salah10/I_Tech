import 'package:flutter/material.dart';
import 'package:i_tech/core/themes/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color = AppColors.primaryColor,
    this.textColor,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,

      minWidth: double.infinity,
      height: 60,
      disabledColor: AppColors.primaryColor.withValues(alpha: 0.1),
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? AppColors.lightBackgroundColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
