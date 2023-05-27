part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.started(
      {required UserEntity entity, required String password}) = _Started;
}
