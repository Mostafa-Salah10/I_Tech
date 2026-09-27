import 'package:flutter/material.dart';
import 'package:i_tech/core/themes/app_colors.dart';

void showAppSnackBar(
  BuildContext context, {
  required String text,
  Color backgroundColor = AppColors.primaryColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text), backgroundColor: backgroundColor),
  );
}
