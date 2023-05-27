import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/domain/auth/repository/auth_repository.dart';

@singleton
class Logout {
  AuthRepository authRepository;

  Logout(this.authRepository);

  Future<Either<Failure, Unit>> call() {
    return authRepository.logout();
  }
}
