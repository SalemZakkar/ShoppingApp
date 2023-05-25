import 'package:dartz/dartz.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';
import 'package:shopping_app_dashboard/domain/items/repository/item_repository.dart';

class GetItemUseCase {
  ItemRepository itemRepository;

  GetItemUseCase(this.itemRepository);

  Future<Either<Failure, ItemEntity>> call(ItemEntity entity) {
    return itemRepository.getItem(entity);
  }
}
