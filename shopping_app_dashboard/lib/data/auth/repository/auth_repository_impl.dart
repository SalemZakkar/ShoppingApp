import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/enums/failure_type.dart';

import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/data/auth/models/local_user_model.dart';
import 'package:shopping_app_dashboard/data/auth/source/local/auth_local_storage.dart';
import 'package:shopping_app_dashboard/data/auth/source/remote/auth_remote.dart';

import 'package:shopping_app_dashboard/domain/auth/entities/user_data.dart';

import '../../../domain/auth/repository/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemote remote;
  AuthLocalDataSource localDataSource;
  AuthRepositoryImpl(this.remote, this.localDataSource);
  @override
  Future<Either<Failure, Unit>> autoLogin() async {
    LocalUserModel localUserModel = await localDataSource.getData();
    if (localUserModel.loggedIn) {
      Either<Failure, Unit> res =
          await login(localUserModel.email!, localUserModel.password!);
      res.fold((l) {
        if (l.type == FailureType.invalidArguments) {
          localDataSource.clear();
        }
      }, (r) {});
      return res;
    }
    return left(const Failure(type: FailureType.unAuth));
  }

  @override
  Future<Either<Failure, UserData>> getUserData() {
    return remote.getUserData();
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    FirebaseAuth.instance.signOut();
    localDataSource.clear();
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> login(String email, String password) async {
    Either<Failure, Unit> res = await remote.login(email, password);
    if (res.isRight()) {
      localDataSource.setData(
          LocalUserModel(loggedIn: true, email: email, password: password));
    }
    return res;
  }
}
