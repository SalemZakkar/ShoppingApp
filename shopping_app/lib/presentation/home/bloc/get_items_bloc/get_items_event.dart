part of 'get_items_bloc.dart';

@freezed
class GetItemsEvent with _$GetItemsEvent {
  const factory GetItemsEvent.started() = _Started;
}
