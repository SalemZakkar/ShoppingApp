import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app/presentation/core/router/app_router.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "please login to enable all the features",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
        20.spaceHeight(),
        AnimatedButton(
            loading: false,
            height: 40,
            width: 100,
            onPressed: () {
              context.router.push(const SignInRoute());
            },
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
