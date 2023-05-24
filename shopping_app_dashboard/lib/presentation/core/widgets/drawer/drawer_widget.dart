import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app_dashboard/domain/auth/usecases/logout_usecase.dart';
import 'package:shopping_app_dashboard/injection.dart';
import 'package:shopping_app_dashboard/presentation/core/router/app_router.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 200,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), bottomRight: Radius.circular(15))),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            30.spaceHeight(),
            const Text(
              "Menu",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'cairo', fontSize: 24),
            ),
            30.spaceHeight(),
            const ListTile(
              title: Text("Items"),
              leading: Icon(Icons.shopping_cart),
            ),
            const ListTile(
              title: Text("Accounts"),
              leading: Icon(Icons.person),
            ),
            const ListTile(
              title: Text("profile"),
              leading: Icon(Icons.supervised_user_circle_outlined),
            ),
            ListTile(
              onTap: () {
                getIt<LogOutUseCase>().call();
                context.router.pushAndPopUntil(const SignInRoute(),
                    predicate: (route) => false);
              },
              title: const Text("logout"),
              leading: const Icon(Icons.logout_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
