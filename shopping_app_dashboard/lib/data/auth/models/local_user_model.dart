import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_user_model.freezed.dart';

@freezed
class LocalUserModel with _$LocalUserModel {
  const factory LocalUserModel(
      {required bool loggedIn,
      String? email,
      String? password}) = _LocalUserModel;
}
