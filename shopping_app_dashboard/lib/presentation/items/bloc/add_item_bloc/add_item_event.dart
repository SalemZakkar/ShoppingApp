part of 'add_item_bloc.dart';

@freezed
class AddItemEvent with _$AddItemEvent {
  const factory AddItemEvent.started(ItemEntity entity) = _Started;
}
