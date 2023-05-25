import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';

import '../repository/auth_repository.dart';

@injectable
class LogOutUseCase {
  AuthRepository authRepository;

  LogOutUseCase(this.authRepository);

  Future<Either<Failure, Unit>> call() async {
    return authRepository.logOut();
  }
}
