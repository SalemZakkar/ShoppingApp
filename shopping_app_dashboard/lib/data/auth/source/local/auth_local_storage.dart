import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app_dashboard/data/auth/models/local_user_model.dart';

@singleton
class AuthLocalDataSource {
  Future<LocalUserModel> getData() async {
    var box = await Hive.openBox("User");
    return LocalUserModel(
        loggedIn: box.get("logged_in") ?? false,
        email: box.get("email"),
        password: box.get("password"));
  }

  Future<void> setData(LocalUserModel localUserModel) async {
    var box = await Hive.openBox("User");
    await box.put("logged_in", localUserModel.loggedIn);
    if (localUserModel.email != null) {
      await box.put("email", localUserModel.email);
    }
    if (localUserModel.password != null) {
      await box.put("password", localUserModel.password);
    }
  }

  Future<void> clear() async {
    (await Hive.openBox("User")).clear();
  }
}
