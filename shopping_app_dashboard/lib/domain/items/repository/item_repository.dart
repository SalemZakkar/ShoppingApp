import 'package:dartz/dartz.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';

abstract class ItemRepository {
  Future<Either<Failure, Unit>> addItem(ItemEntity entity);

  Future<Either<Failure, Unit>> delete(ItemEntity entity);

  Future<Either<Failure, List<ItemEntity>>> getItems();

  Future<Either<Failure, ItemEntity>> getItem(ItemEntity entity);

  Future<Either<Failure, Unit>> updateItem(ItemEntity entity, bool img);
}
