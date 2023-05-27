import 'package:auto_route/auto_route.dart';

import '../../auth/profile_screen.dart';
import '../../auth/sign_in_screen.dart';
import '../../auth/sign_up_screen.dart';
import '../../home/home_screen.dart';
import '../../on_board/on_board_screen.dart';
import '../../splash_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnBoardRoute.page, path: "/on_board"),
        AutoRoute(page: HomeRoute.page, path: "/home"),
        AutoRoute(page: SignInRoute.page, path: "/sign_in"),
        AutoRoute(page: SignUpRoute.page, path: "/sign_up"),
        AutoRoute(page: ProfileRoute.page, path: "/profile"),
        AutoRoute(page: SplashRoute.page, path: "/splash" , initial: true),
      ];
}
