import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lelang_mobile/app/features/authentication/presentation/widgets/forgot_form.dart';

import '../../../../shared/shared.dart';
import '../widgets/auth_background.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: ListView(
          children: [
            _buildHeaderForgot(context),
            _buildBodyForgot(),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeaderForgot(BuildContext context) {
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
        GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Lupa kata sandi',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: AppDimensions.textH4,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Masukan email yang sudah terdaftar, kami akan kirimkan email verifikasi bahwa ini memang Anda!.',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: AppDimensions.textS,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildBodyForgot() {
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
      children: const [
        ForgotForm(),
      ],
    ),
  );
}
