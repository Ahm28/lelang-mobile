import 'package:auto_route/auto_route.dart';

import '../../config/config.dart';

class IntroductionRouter {
  static List<AutoRoute> route = [
    CustomRoute(
      page: SplashRoute.page,
      path: '/',
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: OnboardingRoute.page,
      path: '/onboarding',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ];
}
