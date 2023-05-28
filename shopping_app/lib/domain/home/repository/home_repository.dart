import 'package:dartz/dartz.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/domain/home/domain/item_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ItemEntity>>> getItems();
}
