import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';

import '../../../../domain/auth/usecases/login_usecase.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, BaseState> {
  LoginUseCase loginUseCase;

  SignInBloc(this.loginUseCase) : super(const BaseState()) {
    on<SignInEvent>((event, emit) {});
    on<_Login>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, Unit> res =
          await loginUseCase.call(event.email, event.password);
      res.fold(
          (l) => emit(state.setFailure(l)), (r) => emit(state.setSuccess(r)));
    });
  }
}
