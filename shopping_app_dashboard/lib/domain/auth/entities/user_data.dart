import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';

@freezed
class UserData with _$UserData {
  const factory UserData(
      {required String email,
      required String img,
      required String name}) = _UserData;
}
