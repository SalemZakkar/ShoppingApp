import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';

import '../../../../domain/items/usecases/update_item_usecase.dart';
import '../get_item_bloc/get_item_bloc.dart';

part 'edit_item_bloc.freezed.dart';
part 'edit_item_event.dart';

@injectable
class EditItemBloc extends Bloc<EditItemEvent, BaseState<Unit>> {
  GetItemsBloc bloc;
  UpdateItemUseCase useCase;

  EditItemBloc(this.bloc, this.useCase) : super(const BaseState()) {
    on<EditItemEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, Unit> res = await useCase.call(event.entity, event.img);
      res.fold((l) => emit(state.setFailure(l)), (r) {
        bloc.add(const GetItemEvent.started());
        emit(state.setSuccess(r));
      });
    });
  }
}
