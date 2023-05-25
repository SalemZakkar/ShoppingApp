import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/data/items/source/item_remote.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';
import 'package:shopping_app_dashboard/domain/items/repository/item_repository.dart';

@Singleton(as: ItemRepository)
class ItemRepositoryImpl extends ItemRepository {
  ItemRemote remote;

  ItemRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, Unit>> addItem(ItemEntity entity) {
    return remote.addItem(entity);
  }

  @override
  Future<Either<Failure, Unit>> delete(ItemEntity entity) {
    return remote.delete(entity);
  }

  @override
  Future<Either<Failure, ItemEntity>> getItem(ItemEntity entity) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ItemEntity>>> getItems() {
    return remote.getItems();
  }

  @override
  Future<Either<Failure, Unit>> updateItem(ItemEntity entity, bool img) {
    return remote.updateItem(entity, img);
  }
}
