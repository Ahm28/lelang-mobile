import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.label = '',
    this.controller,
    this.obscureText = false,
    this.hintText,
    this.validator,
    this.suffixIcon,
  });

  final String label;

  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  final String? hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Column(
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  color: AppColors.base900,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppDimensions.gap2.verticalSpace,
            ],
          ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          style: GoogleFonts.inter(
            color: AppColors.base900,
            fontSize: AppDimensions.textM,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              color: AppColors.base300,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: Colors.white,
            errorStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.base300,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.base300,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.base300,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: AppColors.primary700,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.error700!,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: AppColors.error700!,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            suffixIcon: suffixIcon,
            isDense: true,
          ),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
