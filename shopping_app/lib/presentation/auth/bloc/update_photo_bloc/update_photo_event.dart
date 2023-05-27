part of 'update_photo_bloc.dart';

@freezed
class UpdatePhotoEvent with _$UpdatePhotoEvent {
  const factory UpdatePhotoEvent.started({required String path}) = _Started;
}
