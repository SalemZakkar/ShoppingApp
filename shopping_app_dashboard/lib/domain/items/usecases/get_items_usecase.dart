import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';
import 'package:shopping_app_dashboard/domain/items/repository/item_repository.dart';

@injectable
class GetItemsUseCase {
  ItemRepository itemRepository;

  GetItemsUseCase(this.itemRepository);

  Future<Either<Failure, List<ItemEntity>>> call() {
    return itemRepository.getItems();
  }
}
