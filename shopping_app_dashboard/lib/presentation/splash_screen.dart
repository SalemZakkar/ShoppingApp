import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:  CircularProgressIndicator(),
      ),
    );
  }
}
