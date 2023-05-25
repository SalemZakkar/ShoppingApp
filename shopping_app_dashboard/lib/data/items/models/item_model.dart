import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
class ItemModel with _$ItemModel {
  const factory ItemModel(
      {@JsonValue("n/a") required String id,
      required String name,
      required String description,
      required String price,
      required String image,
      required bool active,
      required bool offer}) = _ItemModel;

  factory ItemModel.fromJson(Map<String, Object?> json) =>
      _$ItemModelFromJson(json);
}

extension Convert on ItemModel {
  ItemEntity toDomain() => ItemEntity(
      id: id,
      name: name,
      description: description,
      img: image,
      price: price,
      active: active,
      offer: offer);
}
