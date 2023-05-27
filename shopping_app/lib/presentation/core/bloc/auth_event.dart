part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.setAuth({required bool loggedIn}) = _SetAuth;
  const factory AuthEvent.getFirstTime() = _GetFirstTime;
}
