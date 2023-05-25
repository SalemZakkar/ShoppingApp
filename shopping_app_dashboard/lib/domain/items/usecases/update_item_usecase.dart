import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';
import 'package:shopping_app_dashboard/domain/items/repository/item_repository.dart';

@injectable
class UpdateItemUseCase {
  ItemRepository itemRepository;

  UpdateItemUseCase(this.itemRepository);

  Future<Either<Failure, Unit>> call(ItemEntity entity, bool img) {
    return itemRepository.updateItem(entity, img);
  }
}
