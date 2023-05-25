// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    AddItemRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddItemScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    MangeItemRoute.name: (routeData) {
      final args = routeData.argsAs<MangeItemRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MangeItemScreen(
          key: args.key,
          itemEntity: args.itemEntity,
        ),
      );
    },
  };
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddItemScreen]
class AddItemRoute extends PageRouteInfo<void> {
  const AddItemRoute({List<PageRouteInfo>? children})
      : super(
          AddItemRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddItemRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MangeItemScreen]
class MangeItemRoute extends PageRouteInfo<MangeItemRouteArgs> {
  MangeItemRoute({
    Key? key,
    required ItemEntity itemEntity,
    List<PageRouteInfo>? children,
  }) : super(
          MangeItemRoute.name,
          args: MangeItemRouteArgs(
            key: key,
            itemEntity: itemEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'MangeItemRoute';

  static const PageInfo<MangeItemRouteArgs> page =
      PageInfo<MangeItemRouteArgs>(name);
}

class MangeItemRouteArgs {
  const MangeItemRouteArgs({
    this.key,
    required this.itemEntity,
  });

  final Key? key;

  final ItemEntity itemEntity;

  @override
  String toString() {
    return 'MangeItemRouteArgs{key: $key, itemEntity: $itemEntity}';
  }
}
