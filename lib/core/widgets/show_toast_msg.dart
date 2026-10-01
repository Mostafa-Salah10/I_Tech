import 'package:flutter/material.dart';
import 'package:i_tech/core/themes/app_colors.dart';

void showAppSnackBar(
  BuildContext context, {
  required String text,
  Color backgroundColor = AppColors.primaryColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: MediaQuery.sizeOf(context).width * 0.8,
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      
      content: Text(
        textAlign: .center,
        text,
        style: TextStyle(color: AppColors.lightBackgroundColor, fontSize: 18),
      ),
      backgroundColor: backgroundColor,
    ),
  );
}
