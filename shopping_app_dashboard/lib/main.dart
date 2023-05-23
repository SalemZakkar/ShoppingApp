import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_dashboard/app.dart';

import 'injection.dart';

void main() async {
  configureInjection("DEV");
  runApp(const MainApp());
}
