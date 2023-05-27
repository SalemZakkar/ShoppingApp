import 'package:dartz/dartz.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/domain/auth/enitity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> login(String email, String password);

  Future<Either<Failure, Unit>> signUp(UserEntity userEntity, String password);

  Future<Either<Failure, UserEntity>> getUserData();

  Future<Either<Failure, Unit>> updateUser(String path);

  Future<Either<Failure, Unit>> loginFromMemory();

  Future<bool> getFirstTime();

  Future<Either<Failure, Unit>> logout();
}
