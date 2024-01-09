import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/shared.dart';

final List<Map<String, dynamic>> onBoardingData = [
  {
    'id': 1,
    'title': 'Menyelami Dunia Penawaran dengan BidNest!',
    'body':
        'Gerbang anda menuju lelang seru dan penawaran eksklusif! Katakan selamat tinggal pada kerumitan penawaran tradisional dan nikmati pengalaman lelang yang mulus dan ramah pengguna.',
    'image': AppAssets.onBoarding1,
  },
  {
    'id': 2,
    'title': 'Temukan Pengalaman Lelang Online yang Seru!',
    'body':
        'Tempat di mana keseruan lelang bertemu dengan kenyamanan perangkat mobile Anda! Siapkan diri Anda untuk merasakan dunia penawaran, kemenangan, dan penemuan barang unik.',
    'image': AppAssets.onBoarding1,
  },
  {
    'id': 3,
    'title': 'Paspor Anda Menuju Penawaran dan Kemenangan yang Lebih Mudah!',
    'body':
        'Solusi all-in-one untuk penawaran dan kemenangan yang mudah. BidNest dirancang untuk membuat pengalaman lelang Anda menjadi lebih mudah dan menyenangkan.',
    'image': AppAssets.onBoarding1,
  }
];

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildOnBoardingContent(),
            _buildOnBoardingFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildOnBoardingContent() {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.gap5.h,
            horizontal: AppDimensions.gap5.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              AppDimensions.gap8.verticalSpace,
              FadeIn(
                duration: const Duration(milliseconds: 1080),
                child: Container(
                  height: 150,
                  width: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Svg(
                        onBoardingData[index]['image'],
                      ),
                    ),
                  ),
                ),
              ),
              AppDimensions.gap8.verticalSpace,
              FadeInUp(
                child: Text(
                  onBoardingData[index]['title'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: AppDimensions.textXl,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              AppDimensions.gap4.verticalSpace,
              FadeInUp(
                delay: const Duration(milliseconds: 80),
                child: Text(
                  onBoardingData[index]['body'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: AppColors.base700,
                    fontSize: AppDimensions.textS,
                  ),
                ),
              ),
            ],
          ),
        ),
        onPageChanged: (index) => setState(() {
          currentPage = index;
        }),
      ),
    );
  }

  Widget _buildOnBoardingFooter() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.gap5.h,
        horizontal: AppDimensions.gap5.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < onBoardingData.length; i++)
                Container(
                  height: 8.r,
                  width: 8.r,
                  margin: EdgeInsets.symmetric(
                    horizontal: AppDimensions.gap1.w,
                  ),
                  decoration: BoxDecoration(
                    color: currentPage == i ? Colors.blue : Colors.blue[50],
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                )
            ],
          ),
          AppDimensions.gap4.verticalSpace,
          CustomButton(
            onPressed: () {
              if (currentPage == onBoardingData.length - 1) {
                context.router.replaceNamed('/login');
              }
              _pageController.animateToPage(
                currentPage + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            expanded: true,
            variant: ButtonVariant.primary,
            child: Text(
              currentPage < onBoardingData.length - 1 ? 'Selanjutnya' : "Mulai",
            ),
          )
        ],
      ),
    );
  }
}
