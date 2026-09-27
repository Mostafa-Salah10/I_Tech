import 'package:flutter/material.dart';
import 'package:i_tech/core/themes/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String? hint;
  final bool? isSecure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardTyp;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;

  const AppTextFormField({
    super.key,
    this.validator,
    this.hint,
    this.isSecure,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardTyp,
    this.controller,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      controller: controller,
      keyboardType: keyboardTyp,
      cursorColor: AppColors.primaryColor,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: validator,
      obscureText: isSecure ?? false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        filled: true,
        fillColor: AppColors.greyColor.withValues(alpha: 0.2),
        contentPadding: const EdgeInsets.all(17),
        errorBorder: _customBorder(color: AppColors.errorColor),
        focusedErrorBorder: _customBorder(color: AppColors.errorColor),
        focusedBorder: _customBorder(color: AppColors.primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14),
        ),
        hintText: hint,
      ),
    );
  }

  OutlineInputBorder _customBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
