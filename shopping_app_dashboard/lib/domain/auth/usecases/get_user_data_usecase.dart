import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/auth/entities/user_data.dart';
import 'package:shopping_app_dashboard/domain/auth/repository/auth_repository.dart';

@injectable
class GetUserDataUseCase {
  AuthRepository authRepository;
  GetUserDataUseCase(this.authRepository);
  Future<Either<Failure, UserData>> call() async {
    return authRepository.getUserData();
  }
}
