import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/auth/repository/auth_repository.dart';

@injectable
class AutoLoginUseCase {
  AuthRepository authRepository;

  AutoLoginUseCase(this.authRepository);

  Future<Either<Failure, Unit>> call() async {
    return authRepository.autoLogin();
  }
}
