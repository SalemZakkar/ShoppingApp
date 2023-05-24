import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app_dashboard/app.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection("DEV");
  await Hive.initFlutter();
  runApp(const MainApp());
}
