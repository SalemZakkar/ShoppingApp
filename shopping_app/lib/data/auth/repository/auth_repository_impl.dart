import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/data/auth/models/local_user_model.dart';
import 'package:shopping_app/data/auth/source/local/auth_local_data_source.dart';
import 'package:shopping_app/domain/auth/enitity/user_entity.dart';
import 'package:shopping_app/domain/auth/repository/auth_repository.dart';

import '../source/remote/auth_remote.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthLocalDataSource authLocalDataSource;
  AuthRemote authRemote;

  AuthRepositoryImpl(this.authLocalDataSource, this.authRemote);

  @override
  Future<Either<Failure, UserEntity>> getUserData() {
    return authRemote.getUserData();
  }

  @override
  Future<Either<Failure, Unit>> login(String email, String password) async {
    Either<Failure, Unit> res = await authRemote.login(email, password);
    res.fold((l) => null, (r) async {
      await authLocalDataSource.setData(
          LocalUserModel(loggedIn: true, email: email, password: password));
    });
    return res;
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    await FirebaseAuth.instance.signOut();
    authLocalDataSource.clear();
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> signUp(
      UserEntity userEntity, String password) async {
    Either<Failure, Unit> res = await authRemote.signUp(userEntity, password);
    res.fold((l) => null, (r) {
      authLocalDataSource.setData(LocalUserModel(
          loggedIn: true, email: userEntity.email, password: password));
    });
    return res;
  }

  @override
  Future<Either<Failure, Unit>> updateUser(String path) {
    return authRemote.updateUser(path);
  }

  @override
  Future<bool> getFirstTime() {
    return authLocalDataSource.firstTime();
  }

  @override
  Future<Either<Failure, Unit>> loginFromMemory() async {
    LocalUserModel localUserModel = (await authLocalDataSource.getData());
    if (localUserModel.loggedIn) {
      Either<Failure, Unit> res =
          await login(localUserModel.email, localUserModel.password);
      res.fold((l) {
        if (l.type == FailureType.invalidArguments) {
          authLocalDataSource.clear();
        }
      }, (r) => null);
      return res;
    }
    return left(const Failure(type: FailureType.unAuth));
  }
}
