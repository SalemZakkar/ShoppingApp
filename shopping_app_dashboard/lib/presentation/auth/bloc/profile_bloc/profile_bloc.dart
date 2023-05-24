import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/models/failure.dart';
import 'package:shopping_app_dashboard/domain/auth/entities/user_data.dart';

import '../../../../domain/auth/usecases/get_user_data_usecase.dart';

part 'profile_event.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, BaseState> {
  GetUserDataUseCase getUserDataUseCase;
  ProfileBloc(this.getUserDataUseCase) : super(const BaseState()) {
    on<ProfileEvent>((event, emit) async {
      emit(state.setProgress());
      Either<Failure, UserData> res = await getUserDataUseCase.call();
      res.fold(
          (l) => emit(state.setFailure(l)), (r) => emit(state.setSuccess(r)));
    });
  }
}
