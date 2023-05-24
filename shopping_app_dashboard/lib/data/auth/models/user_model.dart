import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_app_dashboard/domain/auth/entities/user_data.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({required String email, required String name}) =
      _UserModel;
  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

extension Convert on UserModel {
  UserData toDomain() => UserData(email: email, img: "n/a", name: name);
}
