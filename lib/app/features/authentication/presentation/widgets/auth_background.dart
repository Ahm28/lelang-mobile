import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/shared.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 0.3.sh,
          color: AppColors.primary700,
        ),
        Positioned(
          top: -80,
          right: -20,
          child: Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(180),
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: -100,
          child: Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(180),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
