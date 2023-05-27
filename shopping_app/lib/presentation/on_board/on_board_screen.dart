import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app/presentation/core/router/app_router.dart';
import 'package:shopping_app/presentation/core/source/assets.gen.dart';

@RoutePage()
class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          children: [
            Image.asset(
              Assets.images.onBoard4.path,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.7),
              colorBlendMode: BlendMode.darken,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      Text(
                        "you will always find your choice !",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedButton(
                  loading: false,
                  backGroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.6),
                  width: MediaQuery.of(context).size.width * 0.6,
                  radius: 35,
                  height: 45,
                  onPressed: () {
                    context.router.pushAndPopUntil(const HomeRoute(),
                        predicate: (route) => false);
                  },
                  child: const Text(
                    "Let's Go !",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
