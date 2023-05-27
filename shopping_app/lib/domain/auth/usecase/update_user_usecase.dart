import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/domain/auth/enitity/user_entity.dart';
import 'package:shopping_app/domain/auth/repository/auth_repository.dart';

@singleton
class UpdateUserUseCase {
  AuthRepository authRepository;
  UpdateUserUseCase(this.authRepository);
  Future<Either<Failure, Unit>> call(UserEntity userEntity) {
    return authRepository.updateUser(userEntity);
  }
}
