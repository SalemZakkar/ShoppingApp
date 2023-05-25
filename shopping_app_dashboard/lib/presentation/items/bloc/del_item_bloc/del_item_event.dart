part of 'del_item_bloc.dart';

@freezed
class DelItemEvent with _$DelItemEvent {
  const factory DelItemEvent.started(ItemEntity entity) = _Started;
}
