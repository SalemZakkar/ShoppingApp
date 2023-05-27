import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app/domain/auth/enitity/user_entity.dart';

import '../../../../domain/auth/usecase/get_userdata_usecase.dart';

part 'get_profile_bloc.freezed.dart';
part 'get_profile_event.dart';

@injectable
class GetProfileBloc extends Bloc<GetProfileEvent, BaseState<UserEntity>> {
  GetUserDataUseCase getUserDataUseCase;

  GetProfileBloc(this.getUserDataUseCase) : super(const BaseState()) {
    on<GetProfileEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, UserEntity> res = await getUserDataUseCase.call();
      res.fold(
          (l) => emit(state.setFailure(l)), (r) => emit(state.setSuccess(r)));
    });
  }
}
