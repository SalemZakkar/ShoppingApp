import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';

import '../repository/auth_repository.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<Either<Failure, Unit>> call(String email, String password) async {
    return authRepository.login(email, password);
  }
}
