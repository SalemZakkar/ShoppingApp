import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_model.freezed.dart';
part 'user_data_model.g.dart';

@freezed
class UserDataModel with _$UserDataModel {
  const factory UserDataModel(
      {required String name,
      required String email,
      required String gender,
      required String photo,
      String? id}) = _UserDataModel;

  factory UserDataModel.fromJson(Map<String, Object?> json) =>
      _$UserDataModelFromJson(json);
}

extension Convert on UserDataModel {}
