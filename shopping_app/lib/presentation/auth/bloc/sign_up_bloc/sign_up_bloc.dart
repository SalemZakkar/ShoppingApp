import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/domain/auth/enitity/user_entity.dart';

import '../../../../domain/auth/usecase/sign_up_usecase.dart';
import '../../../core/bloc/auth_bloc.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, BaseState> {
  SignUpUseCase signUpUseCase;
  AuthBloc authBloc;

  SignUpBloc(this.signUpUseCase, this.authBloc) : super(const BaseState()) {
    on<SignUpEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, Unit> res =
          await signUpUseCase.call(event.entity, event.password);
      res.fold((l) => emit(state.setFailure(l)), (r) {
        emit(state.setSuccess(r));
        authBloc.add(const AuthEvent.setAuth(loggedIn: true));
      });
    });
  }
}
