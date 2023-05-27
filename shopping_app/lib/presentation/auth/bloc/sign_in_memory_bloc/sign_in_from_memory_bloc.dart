import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';

import '../../../../domain/auth/usecase/login_from_memory_usecase.dart';
import '../../../core/bloc/auth_bloc.dart';

part 'sign_in_from_memory_event.dart';
part 'sign_in_from_memory_bloc.freezed.dart';

@injectable
class SignInFromMemoryBloc extends Bloc<SignInFromMemoryEvent, BaseState> {
  LoginFromMemoryUseCase loginFromMemoryUseCase;
  AuthBloc authBloc;
  SignInFromMemoryBloc(this.loginFromMemoryUseCase, this.authBloc)
      : super(const BaseState()) {
    on<SignInFromMemoryEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, Unit> res = await loginFromMemoryUseCase.call();
      res.fold((l) => emit(state.setFailure(l)), (r) {
        emit(state.setSuccess(r));
        authBloc.add(const AuthEvent.setAuth(loggedIn: true));
      });
    });
  }
}
