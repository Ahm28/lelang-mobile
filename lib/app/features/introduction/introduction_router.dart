import 'package:auto_route/auto_route.dart';

import '../../config/config.dart';

class IntroductionRouter {
  static List<AutoRoute> route = [
    AutoRoute(
      page: SplashRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: OnboardingRoute.page,
      path: '/onboarding',
    ),
  ];
}
