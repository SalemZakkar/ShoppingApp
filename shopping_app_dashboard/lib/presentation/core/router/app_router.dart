import 'package:auto_route/auto_route.dart';

import '../../auth/sign_in.dart';
import '../../home/home_screen.dart';
import '../../splash/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page, path: "/login"),
        AutoRoute(page: SplashRoute.page, path: "/loading", initial: true),
        AutoRoute(page: HomeRoute.page, path: "/home")
      ];
}
