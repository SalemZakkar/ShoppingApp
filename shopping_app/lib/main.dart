import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/app.dart';
import 'package:shopping_app/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection("DEV");
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MainApp());
}
