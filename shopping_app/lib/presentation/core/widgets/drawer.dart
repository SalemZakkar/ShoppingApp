import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/domain/auth/usecase/logout_usecase.dart';
import 'package:shopping_app/presentation/core/bloc/auth_bloc.dart';
import 'package:shopping_app/presentation/core/router/app_router.dart';

import '../../../injection.dart';
import 'login_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is UnAuthenticated) {
            return const LoginWidget();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor,
                  height: 200,
                  alignment: Alignment.center,
                  child: Text(
                    "Menu",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    "Home",
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: const Icon(Icons.home),
                ),
                ListTile(
                  onTap: () {
                    context.router.pop();
                    context.router.push(const ProfileRoute());
                  },
                  title: const Text(
                    "Profile",
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: const Icon(Icons.person),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    "Orders",
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: const Icon(Icons.local_activity_outlined),
                ),
                ListTile(
                  onTap: () async {
                    getIt<Logout>().call();
                    getIt<AuthBloc>()
                        .add(const AuthEvent.setAuth(loggedIn: false));
                    context.router.pop();
                  },
                  title: const Text(
                    "Log out",
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
