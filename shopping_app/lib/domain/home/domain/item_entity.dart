import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_entity.freezed.dart';

@freezed
class ItemEntity with _$ItemEntity {
  const factory ItemEntity(
      {required String id,
      required String image,
      required String name,
      required String description,
      required bool offer,
      required String price}) = _ItemEntity;
}
