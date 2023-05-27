import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app/domain/auth/usecase/login_from_memory_usecase.dart';

import '../../../domain/auth/usecase/first_time_usecase.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirstTimeUseCase getFirstTimeUseCase;
  LoginFromMemoryUseCase loginFromMemory;

  AuthBloc(this.getFirstTimeUseCase, this.loginFromMemory)
      : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<_GetFirstTime>((event, emit) async {
      emit(UnAuthenticated(firstTime: await getFirstTimeUseCase.call()));
    });
    on<_SetAuth>((event, emit) {
      if (event.loggedIn) {
        emit(const Authenticated());
      } else {
        emit(const UnAuthenticated(firstTime: false));
      }
    });
  }
}
