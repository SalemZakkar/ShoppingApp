import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';

import '../../../domain/auth/usecases/auto_login_usecase.dart';

part 'auto_login_bloc.freezed.dart';
part 'auto_login_event.dart';

@injectable
class AutoLoginBloc extends Bloc<AutoLoginEvent, BaseState> {
  AutoLoginUseCase autoLoginUseCase;

  AutoLoginBloc(this.autoLoginUseCase) : super(const BaseState()) {
    on<AutoLoginEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, Unit> res = await autoLoginUseCase.call();
      res.fold(
          (l) => emit(state.setFailure(l)), (r) => emit(state.setSuccess(r)));
    });
  }
}
