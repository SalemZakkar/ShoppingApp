import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/domain/home/domain/item_entity.dart';

import '../../../../domain/home/usecases/get_items_usecase.dart';

part 'get_items_event.dart';
part 'get_items_bloc.freezed.dart';

@injectable
class GetItemsBloc extends Bloc<GetItemsEvent, BaseState<List<ItemEntity>>> {
  GetItemsUseCase getItemsUseCase;
  GetItemsBloc(this.getItemsUseCase) : super(const BaseState()) {
    on<GetItemsEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, List<ItemEntity>> res = await getItemsUseCase.call();
      res.fold(
          (l) => emit(state.setFailure(l)), (r) => emit(state.setSuccess(r)));
    });
  }
}
