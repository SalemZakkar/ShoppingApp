// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalUserModel {
  bool get loggedIn => throw _privateConstructorUsedError;

  String? get email => throw _privateConstructorUsedError;

  String? get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalUserModelCopyWith<LocalUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalUserModelCopyWith<$Res> {
  factory $LocalUserModelCopyWith(
          LocalUserModel value, $Res Function(LocalUserModel) then) =
      _$LocalUserModelCopyWithImpl<$Res, LocalUserModel>;

  @useResult
  $Res call({bool loggedIn, String? email, String? password});
}

/// @nodoc
class _$LocalUserModelCopyWithImpl<$Res, $Val extends LocalUserModel>
    implements $LocalUserModelCopyWith<$Res> {
  _$LocalUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loggedIn = null,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      loggedIn: null == loggedIn
          ? _value.loggedIn
          : loggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalUserModelCopyWith<$Res>
    implements $LocalUserModelCopyWith<$Res> {
  factory _$$_LocalUserModelCopyWith(
          _$_LocalUserModel value, $Res Function(_$_LocalUserModel) then) =
      __$$_LocalUserModelCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({bool loggedIn, String? email, String? password});
}

/// @nodoc
class __$$_LocalUserModelCopyWithImpl<$Res>
    extends _$LocalUserModelCopyWithImpl<$Res, _$_LocalUserModel>
    implements _$$_LocalUserModelCopyWith<$Res> {
  __$$_LocalUserModelCopyWithImpl(
      _$_LocalUserModel _value, $Res Function(_$_LocalUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loggedIn = null,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_LocalUserModel(
      loggedIn: null == loggedIn
          ? _value.loggedIn
          : loggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LocalUserModel implements _LocalUserModel {
  const _$_LocalUserModel({required this.loggedIn, this.email, this.password});

  @override
  final bool loggedIn;
  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'LocalUserModel(loggedIn: $loggedIn, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalUserModel &&
            (identical(other.loggedIn, loggedIn) ||
                other.loggedIn == loggedIn) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loggedIn, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalUserModelCopyWith<_$_LocalUserModel> get copyWith =>
      __$$_LocalUserModelCopyWithImpl<_$_LocalUserModel>(this, _$identity);
}

abstract class _LocalUserModel implements LocalUserModel {
  const factory _LocalUserModel(
      {required final bool loggedIn,
      final String? email,
      final String? password}) = _$_LocalUserModel;

  @override
  bool get loggedIn;

  @override
  String? get email;

  @override
  String? get password;

  @override
  @JsonKey(ignore: true)
  _$$_LocalUserModelCopyWith<_$_LocalUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
