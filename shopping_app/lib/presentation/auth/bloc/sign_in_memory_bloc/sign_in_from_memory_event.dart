part of 'sign_in_from_memory_bloc.dart';

@freezed
class SignInFromMemoryEvent with _$SignInFromMemoryEvent {
  const factory SignInFromMemoryEvent.started() = _Started;
}
