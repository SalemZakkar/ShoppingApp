import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/data/core/request_checker.dart';
import 'package:shopping_app_dashboard/data/items/models/item_model.dart';

import '../../../domain/items/entities/item_entity.dart';

@singleton
class ItemRemote with RequestChecker {
  Future<Either<Failure, Unit>> addItem(ItemEntity entity) async {
    return await request<Unit>(() async {
      String img = entity.img;
      String id = (await FirebaseFirestore.instance.collection("items").add({
        "name": entity.name,
        "description": entity.description,
        "price": entity.price,
        "offer": entity.offer,
        "active": entity.active,
      }))
          .path;
      FirebaseStorage firebaseStorage = FirebaseStorage.instance;
      String url = await (await firebaseStorage.ref(id).putFile(File(img)))
          .ref
          .getDownloadURL();
      await FirebaseFirestore.instance
          .collection("items")
          .doc(id.split("/").last)
          .update({"image": url, "id": id.split("/").last});
      return unit;
    });
  }

  Future<Either<Failure, List<ItemEntity>>> getItems() async {
    return await request(() async {
      List<ItemEntity> res = [];
      CollectionReference reference =
          FirebaseFirestore.instance.collection("items");
      QuerySnapshot querySnapshot = await reference.get();
      querySnapshot.docs.map((e) {
        res.add(
            ItemModel.fromJson(e.data() as Map<String, dynamic>).toDomain());
        return e.data();
      }).toList();
      return res;
    });
  }

  // Future<Either<Failure, ItemEntity>> getItem(ItemEntity entity);
  Future<Either<Failure, Unit>> updateItem(ItemEntity entity, bool img) async {
    return await request<Unit>(() async {
      String url = "";
      if (img) {
        await FirebaseStorage.instance.ref("/items/${entity.id}").delete();
        url = await (await FirebaseStorage.instance
                .ref("/items/${entity.id}")
                .putFile(File(entity.img)))
            .ref
            .getDownloadURL();
      }
      Map<String, dynamic> data = {
        "name": entity.name,
        "description": entity.description,
        "price": entity.price,
        "active": entity.active,
        "offer": entity.offer,
      };
      if (img) {
        data.putIfAbsent("image", () => url);
      }
      await FirebaseFirestore.instance
          .collection("/items")
          .doc(entity.id)
          .update(data);
      return unit;
    });
  }

  Future<Either<Failure, Unit>> delete(ItemEntity entity) async {
    return await request(() async {
      await FirebaseFirestore.instance
          .collection("items")
          .doc(entity.id)
          .delete();
      await FirebaseStorage.instance.ref("/items/${entity.id}").delete();
      return unit;
    });
  }
}
