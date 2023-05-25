import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';

import '../../../../domain/items/usecases/add_item_usecase.dart';
import '../get_item_bloc/get_item_bloc.dart';

part 'add_item_bloc.freezed.dart';
part 'add_item_event.dart';

@injectable
class AddItemBloc extends Bloc<AddItemEvent, BaseState> {
  AddItemUseCase addItemUseCase;
  GetItemsBloc getItemsBloc;

  AddItemBloc(this.addItemUseCase, this.getItemsBloc)
      : super(const BaseState()) {
    on<AddItemEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, Unit> res = await addItemUseCase.call(event.entity);
      res.fold((l) => emit(state.setFailure(l)), (r) {
        getItemsBloc.add(const GetItemEvent.started());
        emit(state.setSuccess(r));
      });
    });
  }
}
