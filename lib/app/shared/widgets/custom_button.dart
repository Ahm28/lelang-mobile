import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared.dart';

enum ButtonVariant { primary, secondary, outline }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.expanded = false,
    this.onPressed,
    this.child,
    this.variant = ButtonVariant.primary,
  });

  final bool expanded;
  final void Function()? onPressed;
  final Widget? child;
  final ButtonVariant? variant;

  @override
  Widget build(BuildContext context) {
    ButtonStyle? buttonStyle;

    switch (variant) {
      case ButtonVariant.primary:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary700,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: AppDimensions.textL,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        );
      case ButtonVariant.secondary:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary50,
          foregroundColor: AppColors.primary700,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: AppDimensions.textL,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        );
      case ButtonVariant.outline:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.primary700,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.base50, width: 2),
            borderRadius: BorderRadius.circular(5.r),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: AppDimensions.textL,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        );
      default:
    }

    return SizedBox(
      width: expanded ? double.infinity : null,
      height: 47,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: child,
      ),
    );
  }
}
