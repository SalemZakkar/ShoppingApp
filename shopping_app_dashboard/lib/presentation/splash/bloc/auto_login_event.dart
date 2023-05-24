part of 'auto_login_bloc.dart';

@freezed
class AutoLoginEvent with _$AutoLoginEvent {
  const factory AutoLoginEvent.started() = _Started;
}
