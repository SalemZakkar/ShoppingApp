import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';

import '../../../../domain/auth/usecase/update_user_usecase.dart';

part 'update_photo_bloc.freezed.dart';
part 'update_photo_event.dart';

@injectable
class UpdatePhotoBloc extends Bloc<UpdatePhotoEvent, BaseState> {
  UpdateUserUseCase useCase;

  UpdatePhotoBloc(this.useCase) : super(const BaseState()) {
    on<UpdatePhotoEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, Unit> res = await useCase.call(event.path);
      res.fold(
          (l) => emit(state.setFailure(l)), (r) => emit(state.setSuccess(r)));
    });
  }
}
