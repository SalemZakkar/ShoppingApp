import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';

import '../../../../domain/items/usecases/get_items_usecase.dart';

part 'get_item_bloc.freezed.dart';
part 'get_item_event.dart';

@singleton
class GetItemsBloc extends Bloc<GetItemEvent, BaseState<List<ItemEntity>>> {
  GetItemsUseCase useCase;

  GetItemsBloc(this.useCase) : super(const BaseState()) {
    on<GetItemEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, List<ItemEntity>> res = await useCase.call();
      res.fold(
          (l) => emit(state.setFailure(l)), (r) => emit(state.setSuccess(r)));
    });
  }
}
