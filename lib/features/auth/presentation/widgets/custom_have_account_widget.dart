
import 'package:flutter/material.dart';
import 'package:i_tech/core/themes/app_colors.dart';

class CustomDonHaveAccountWidget extends StatelessWidget {
  const CustomDonHaveAccountWidget({
    super.key,
    required this.leadingText,
    required this.trailingText,
    required this.onTap,
  });

  final String leadingText;
  final String trailingText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leadingText,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: AppColors.blueGreyColor,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            trailingText,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
