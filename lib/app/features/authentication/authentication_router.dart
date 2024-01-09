import 'package:auto_route/auto_route.dart';

import '../../config/config.dart';

class AuthenticationRouter {
  static List<AutoRoute> route = [
    CustomRoute(
      page: LoginRoute.page,
      path: '/login',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: RegisterRoute.page,
      path: '/register',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: ForgotPasswordRoute.page,
      path: '/forgot-password',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ];
}
