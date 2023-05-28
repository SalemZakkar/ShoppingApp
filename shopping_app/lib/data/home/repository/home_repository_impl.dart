import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/data/home/source/home_remote.dart';
import 'package:shopping_app/domain/home/domain/item_entity.dart';
import 'package:shopping_app/domain/home/repository/home_repository.dart';
@Singleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRemote remote;
  HomeRepositoryImpl(this.remote);
  @override
  Future<Either<Failure, List<ItemEntity>>> getItems() {
    return remote.getItems();
  }
}
