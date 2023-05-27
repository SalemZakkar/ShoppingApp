import 'package:injectable/injectable.dart';
import 'package:shopping_app/domain/auth/repository/auth_repository.dart';

@singleton
class FirstTimeUseCase {
  AuthRepository authRepository;

  FirstTimeUseCase(this.authRepository);

  Future<bool> call() {
    return authRepository.getFirstTime();
  }
}
