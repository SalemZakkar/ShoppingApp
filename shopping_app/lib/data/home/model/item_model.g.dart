// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemModel _$$_ItemModelFromJson(Map<String, dynamic> json) => _$_ItemModel(
      name: json['name'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
      active: json['active'] as bool,
      offer: json['offer'] as bool,
      price: json['price'] as String,
    );

Map<String, dynamic> _$$_ItemModelToJson(_$_ItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'id': instance.id,
      'image': instance.image,
      'active': instance.active,
      'offer': instance.offer,
      'price': instance.price,
    };
