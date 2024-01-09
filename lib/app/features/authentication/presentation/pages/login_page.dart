import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/shared.dart';
import '../widgets/auth_background.dart';
import '../widgets/login_form.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: ListView(
          children: [
            _buildHeaderLogin(),
            _buildBodyLogin(),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeaderLogin() {
  return Container(
    height: 0.22.sh,
    padding: EdgeInsets.symmetric(
      vertical: AppDimensions.gap5.h,
      horizontal: AppDimensions.gap5.w,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: AppDimensions.textH4,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Selamat datang kembali!',
              style: GoogleFonts.inter(
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildBodyLogin() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    child: ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.gap5.h,
        horizontal: AppDimensions.gap5.w,
      ),
      children: [
        CustomButton(
          onPressed: () {},
          variant: ButtonVariant.outline,
          child: Row(
            children: [
              Image.asset(AppAssets.googleIcon),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login dengan Google',
                      style: TextStyle(
                        color: AppColors.base900,
                        fontSize: AppDimensions.textM,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        AppDimensions.gap3.verticalSpace,
        CustomButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.facebookIcon),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login dengan Facebook',
                      style: TextStyle(
                        fontSize: AppDimensions.textM,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        AppDimensions.gap4.verticalSpace,
        Row(
          children: [
            Expanded(
              child: Container(
                height: 2,
                decoration: const BoxDecoration(color: AppColors.base50),
              ),
            ),
            AppDimensions.gap2.horizontalSpace,
            Text(
              'Atau',
              style: GoogleFonts.inter(
                color: AppColors.base700,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppDimensions.gap2.horizontalSpace,
            Expanded(
              child: Container(
                height: 2,
                decoration: const BoxDecoration(color: AppColors.base50),
              ),
            ),
          ],
        ),
        AppDimensions.gap4.verticalSpace,
        const LoginForm(),
      ],
    ),
  );
}
