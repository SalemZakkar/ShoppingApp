import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';
import 'package:shopping_app_dashboard/domain/items/repository/item_repository.dart';

@injectable
class DeleteItemUseCase {
  ItemRepository itemRepository;

  DeleteItemUseCase(this.itemRepository);

  Future<Either<Failure, Unit>> call(ItemEntity entity) {
    return itemRepository.delete(entity);
  }
}
