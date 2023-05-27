import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../models/local_user_model.dart';

@singleton
class AuthLocalDataSource {
  Future<LocalUserModel> getData() async {
    var box = await Hive.openBox("User");

    return LocalUserModel(
        loggedIn: box.get("logged_in") ?? false,
        email: box.get("email") ?? "n/a",
        password: box.get("password") ?? "n/a");
  }

  Future<void> setData(LocalUserModel localUserModel) async {
    var box = await Hive.openBox("User");
    await box.put("email", localUserModel.email);
    await box.put("password", localUserModel.password);
    await box.put("logged_in", true);
  }

  Future<bool> firstTime() async {
    var box = await Hive.openBox("ui");
    if (box.get("firstTime") != null) {
      return box.get("firstTime");
    }
    await box.put("firstTime", false);
    return true;
  }

  Future<void> clear() async {
    (await Hive.openBox("User")).clear();
  }
}
