import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';

import '../../../../domain/items/usecases/delete_item_usecase.dart';
import '../get_item_bloc/get_item_bloc.dart';

part 'del_item_bloc.freezed.dart';
part 'del_item_event.dart';

@injectable
class DelItemBloc extends Bloc<DelItemEvent, BaseState> {
  DeleteItemUseCase deleteItemUseCase;
  GetItemsBloc bloc;

  DelItemBloc(this.deleteItemUseCase, this.bloc) : super(const BaseState()) {
    on<DelItemEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, Unit> res = await deleteItemUseCase.call(event.entity);
      res.fold((l) => emit(state.setFailure(l)), (r) {
        bloc.add(const GetItemEvent.started());
        emit(state.setSuccess(r));
      });
    });
  }
}
