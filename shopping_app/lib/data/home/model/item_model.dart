import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.freezed.dart';

part 'item_model.g.dart';

@freezed
class ItemModel with _$ItemModel {
  const factory ItemModel({
    required String name,
    required String description,
    required String id,
    required String image,
    required bool active,
    required bool offer,
    required String price,
  }) = _ItemModel;
  factory ItemModel.fromJson(Map<String, Object?> json) =>
      _$ItemModelFromJson(json);
}
