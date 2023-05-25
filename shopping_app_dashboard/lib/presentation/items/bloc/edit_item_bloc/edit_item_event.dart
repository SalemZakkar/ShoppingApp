part of 'edit_item_bloc.dart';

@freezed
class EditItemEvent with _$EditItemEvent {
  const factory EditItemEvent.started(ItemEntity entity, bool img) = _Started;
}
