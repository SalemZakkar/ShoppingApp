import 'package:dartz/dartz.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/auth/entities/user_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> login(String email, String password);
  Future<Either<Failure, Unit>> logOut();
  Future<Either<Failure, Unit>> autoLogin();
  Future<Either<Failure, UserData>> getUserData();
}
