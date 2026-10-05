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
  final ValueChanged<String>? onChanged;
  final String ? initialValue;

  final int? maxLength;

  const AppTextFormField({
    super.key,
    this.maxLength,
    this.validator,
    this.hint,
    this.isSecure,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardTyp,
    this.controller,
    this.maxLines,
    this.minLines,
    this.onChanged, this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final prefixMultipleLineIcon = (maxLines ?? 1) > 1 && prefixIcon != null;

    return Stack(
      children: [
        TextFormField(
          initialValue:initialValue ,
          maxLength: maxLength,
          onChanged: onChanged,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          controller: controller,
          keyboardType: keyboardTyp,
          cursorColor: AppColors.primaryColor,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          validator: validator,
          obscureText: isSecure ?? false,
          decoration: InputDecoration(
            prefixIcon: prefixMultipleLineIcon ? null : prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            hintStyle: TextStyle(fontSize: 18, color: AppColors.blueGreyColor),
            fillColor: AppColors.greyColor.withValues(alpha: 0.15),
            contentPadding: EdgeInsets.fromLTRB(
              prefixMultipleLineIcon ? 53 : 17,
              17,
              17,
              17,
            ),
            errorBorder: _customBorder(color: AppColors.errorColor),
            focusedErrorBorder: _customBorder(color: AppColors.errorColor),
            focusedBorder: _customBorder(color: AppColors.primaryColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14),
            ),
            hintText: hint,
          ),
        ),
        if (prefixMultipleLineIcon)
          PositionedDirectional(start: 17, top: 17, child: prefixIcon!),
      ],
    );
  }
}

OutlineInputBorder _customBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 2),
    borderRadius: BorderRadius.circular(20),
  );
}
