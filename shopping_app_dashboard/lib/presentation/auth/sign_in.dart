import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:salem_package/salem_package.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with ScreenUtil {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.center,
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome!",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 35),
              ),
              10.spaceHeight(),
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
              ),
              20.spaceHeight(),
              TextFormField(
                decoration: const InputDecoration(hintText: "Password"),
              ),
              30.spaceHeight(),
              AnimatedButton(
                loading: false,
                height: 40,
                width: 100,
                onPressed: () {
                  showLoading(context);
                },
                loadColor: Colors.white,
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
