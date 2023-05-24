import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/data/auth/models/user_model.dart';
import 'package:shopping_app_dashboard/data/auth/source/remote/auth_remote.dart';
import 'package:shopping_app_dashboard/domain/auth/entities/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/request_checker.dart';

@Singleton(as: AuthRemote)
class AuthRemoteImpl extends AuthRemote with RequestChecker {
  @override
  Future<Either<Failure, UserData>> getUserData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return await request(() async {
      UserModel model = UserModel.fromJson(
          (await FirebaseFirestore.instance.collection("users").doc(uid).get())
              .data()!);
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, Unit>> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> login(String email, String password) async {
    return await request<Unit>(() async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return unit;
    });
  }
}
