import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/data/core/request_checker.dart';
import 'package:shopping_app/data/home/model/item_model.dart';
import 'package:shopping_app/domain/home/domain/item_entity.dart';
@singleton
class HomeRemote with RequestChecker {
  Future<Either<Failure, List<ItemEntity>>> getItems() async {
    return await request<List<ItemEntity>>(() async {
      List<ItemEntity> res = [];
      List<ItemModel> raw = [];
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
          (await FirebaseFirestore.instance.collection("items").get()).docs;
      for (var element in docs) {
        if (element.data()["active"]) {
          raw.add(ItemModel.fromJson(element.data()));
        }
      }
      for (var element in raw) {
        res.add(ItemEntity(
            id: element.id,
            image: element.image,
            name: element.name,
            description: element.description,
            offer: element.offer,
            price: element.price));
      }
      return res;
    });
  }
}
