import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/items/entities/item_entity.dart';
import '../../auth/sign_in.dart';
import '../../home/home_screen.dart';
import '../../items/add_item_screen.dart';
import '../../items/manage_item_screen.dart';
import '../../splash/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page, path: "/login"),
        AutoRoute(page: SplashRoute.page, path: "/loading", initial: true),
        AutoRoute(page: HomeRoute.page, path: "/home"),
        AutoRoute(page: AddItemRoute.page, path: "/addItem"),
        AutoRoute(page: MangeItemRoute.page, path: "/manageItem"),
      ];
}
