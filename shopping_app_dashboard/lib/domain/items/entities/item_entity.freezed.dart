// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemEntity {
  String get id => throw _privateConstructorUsedError;

  String get name => throw _privateConstructorUsedError;

  String get description => throw _privateConstructorUsedError;

  String get img => throw _privateConstructorUsedError;

  String get price => throw _privateConstructorUsedError;

  bool get active => throw _privateConstructorUsedError;

  bool get offer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemEntityCopyWith<ItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEntityCopyWith<$Res> {
  factory $ItemEntityCopyWith(
          ItemEntity value, $Res Function(ItemEntity) then) =
      _$ItemEntityCopyWithImpl<$Res, ItemEntity>;

  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String img,
      String price,
      bool active,
      bool offer});
}

/// @nodoc
class _$ItemEntityCopyWithImpl<$Res, $Val extends ItemEntity>
    implements $ItemEntityCopyWith<$Res> {
  _$ItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? img = null,
    Object? price = null,
    Object? active = null,
    Object? offer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      offer: null == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemEntityCopyWith<$Res>
    implements $ItemEntityCopyWith<$Res> {
  factory _$$_ItemEntityCopyWith(
          _$_ItemEntity value, $Res Function(_$_ItemEntity) then) =
      __$$_ItemEntityCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String img,
      String price,
      bool active,
      bool offer});
}

/// @nodoc
class __$$_ItemEntityCopyWithImpl<$Res>
    extends _$ItemEntityCopyWithImpl<$Res, _$_ItemEntity>
    implements _$$_ItemEntityCopyWith<$Res> {
  __$$_ItemEntityCopyWithImpl(
      _$_ItemEntity _value, $Res Function(_$_ItemEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? img = null,
    Object? price = null,
    Object? active = null,
    Object? offer = null,
  }) {
    return _then(_$_ItemEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      offer: null == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ItemEntity implements _ItemEntity {
  const _$_ItemEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.img,
      required this.price,
      required this.active,
      required this.offer});

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String img;
  @override
  final String price;
  @override
  final bool active;
  @override
  final bool offer;

  @override
  String toString() {
    return 'ItemEntity(id: $id, name: $name, description: $description, img: $img, price: $price, active: $active, offer: $offer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.offer, offer) || other.offer == offer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, img, price, active, offer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemEntityCopyWith<_$_ItemEntity> get copyWith =>
      __$$_ItemEntityCopyWithImpl<_$_ItemEntity>(this, _$identity);
}

abstract class _ItemEntity implements ItemEntity {
  const factory _ItemEntity(
      {required final String id,
      required final String name,
      required final String description,
      required final String img,
      required final String price,
      required final bool active,
      required final bool offer}) = _$_ItemEntity;

  @override
  String get id;

  @override
  String get name;

  @override
  String get description;

  @override
  String get img;

  @override
  String get price;

  @override
  bool get active;

  @override
  bool get offer;

  @override
  @JsonKey(ignore: true)
  _$$_ItemEntityCopyWith<_$_ItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
