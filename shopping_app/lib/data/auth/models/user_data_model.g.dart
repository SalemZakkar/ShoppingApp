// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataModel _$$_UserDataModelFromJson(Map<String, dynamic> json) =>
    _$_UserDataModel(
      name: json['name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      photo: json['photo'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_UserDataModelToJson(_$_UserDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'photo': instance.photo,
      'id': instance.id,
    };
