import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lelang_mobile/app/shared/shared.dart';

extension BuildContextExtension on BuildContext {
  Loader get loader => Loader(this);
  Toast get toast => Toast(this);
}

class Loader {
  Loader(this._context);

  final BuildContext _context;

  void show({
    Widget? loader,
  }) =>
      showDialog(
        context: _context,
        barrierColor: Colors.white.withOpacity(0.2),
        builder: (context) => WillPopScope(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Center(
              child: loader ?? const CircularProgressIndicator(),
            ),
          ),
          onWillPop: () => Future.value(false),
        ),
      );

  void dismiss() => Navigator.of(_context, rootNavigator: true).pop();
}

enum ToastType { success, info, error }

class Toast {
  Toast(this._context);

  final BuildContext _context;

  void show({
    required ToastType type,
    String message = '',
  }) {
    Color? backgroundColor;
    Color? textColor;
    Widget? icon;

    switch (type) {
      case ToastType.success:
        backgroundColor = AppColors.success50;
        textColor = AppColors.success700;
        icon = Icon(
          Icons.check_circle,
          color: AppColors.success700,
        );
      case ToastType.info:
        backgroundColor = AppColors.primary50;
        textColor = AppColors.primary700;
        icon = Icon(
          Icons.info,
          color: AppColors.primary700,
        );
      case ToastType.error:
        backgroundColor = AppColors.error50;
        textColor = AppColors.error700;
        icon = Icon(
          FluentIcons.warning_20_filled,
          size: 24,
          color: AppColors.error700,
        );
      default:
        backgroundColor = AppColors.base50;
        textColor = AppColors.base900;
    }

    showToastWidget(
      Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.gap5.w,
        ),
        padding: const EdgeInsets.all(AppDimensions.gap4).r,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.bsae100.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            icon!,
            AppDimensions.gap2.horizontalSpace,
            Text(
              message,
              style: GoogleFonts.inter(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      context: _context,
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.slideToTop,
      position: StyledToastPosition.top,
      startOffset: const Offset(0.0, -3.0),
      reverseEndOffset: const Offset(0.0, -3.0),
      duration: const Duration(seconds: 4),
      animDuration: const Duration(seconds: 1),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastOutSlowIn,
    );
  }
}
