import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/domain/home/domain/item_entity.dart';
import 'package:shopping_app/domain/home/repository/home_repository.dart';
@singleton
class GetItemsUseCase {
  HomeRepository homeRepository;
  GetItemsUseCase(this.homeRepository);
  Future<Either<Failure, List<ItemEntity>>> call() {
    return homeRepository.getItems();
  }
}
