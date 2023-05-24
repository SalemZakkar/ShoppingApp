import 'package:flutter/material.dart';
import 'package:shopping_app_dashboard/presentation/core/sources/light_theme.dart';
import 'package:shopping_app_dashboard/presentation/core/router/app_router.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: appRouter.config(),
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            Focus.of(context).unfocus();
          },
          behavior: HitTestBehavior.opaque,
          child: child!,
        );
      },
    );
  }
}
