import 'package:auto_route/auto_route.dart';

import '../../features/authentication/authentication.dart';
import '../../features/introduction/introduction.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        ...IntroductionRouter.route,
        ...AuthenticationRouter.route,
      ];
}
