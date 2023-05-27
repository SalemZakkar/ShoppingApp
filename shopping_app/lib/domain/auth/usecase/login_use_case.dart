import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/domain/auth/repository/auth_repository.dart';
@singleton
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);
  Future<Either<Failure, Unit>> call(String email, String password) {
    return authRepository.login(email, password);
  }
}
