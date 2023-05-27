import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/presentation/core/bloc/auth_bloc.dart';
import 'package:shopping_app/presentation/core/router/app_router.dart';
import 'package:shopping_app/presentation/core/source/light_theme.dart';

import 'injection.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) {
        getIt<AuthBloc>().add(const AuthEvent.getFirstTime());
        return getIt<AuthBloc>();
      },
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Focus.of(context).unfocus();
            },
            child: child,
          );
        },
      ),
    );
  }
}
