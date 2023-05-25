import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_entity.freezed.dart';

@freezed
class ItemEntity with _$ItemEntity {
  const factory ItemEntity(
      {required String id,
      required String name,
      required String description,
      required String img,
      required String price,
      required bool active,
      required bool offer}) = _ItemEntity;
}
