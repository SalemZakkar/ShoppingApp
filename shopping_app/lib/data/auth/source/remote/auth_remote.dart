import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/data/core/request_checker.dart';
import 'package:shopping_app/domain/auth/enitity/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@singleton
class AuthRemote with RequestChecker {
  Future<Either<Failure, UserEntity>> getUserData() {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

  Future<Either<Failure, Unit>> login(String email, String password) async {
    return await request(() async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return unit;
    });
  }

  Future<Either<Failure, Unit>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  Future<Either<Failure, Unit>> signUp(UserEntity userEntity, password) async {
    return await request(() async {
      String id = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: userEntity.email, password: password))
          .user!
          .uid;
      await FirebaseFirestore.instance.collection("users").doc(id).set({
        "name": userEntity.name,
        "photo": "url",
        "email": userEntity.email,
        "gender": userEntity.gender,
        "role": "user"
      });
      return unit;
    });
  }

  Future<Either<Failure, Unit>> updateUser(UserEntity userEntity) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
