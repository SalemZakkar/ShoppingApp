import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/domain/auth/enitity/user_entity.dart';
import 'package:shopping_app/domain/auth/repository/auth_repository.dart';

@singleton
class GetUserDataUseCase {
  AuthRepository authRepository;

  GetUserDataUseCase(this.authRepository);

  Future<Either<Failure, UserEntity>> call() {
    return authRepository.getUserData();
  }
}
