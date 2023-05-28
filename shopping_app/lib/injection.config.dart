// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_core/firebase_core.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shopping_app/data/auth/repository/auth_repository_impl.dart'
    as _i6;
import 'package:shopping_app/data/auth/source/local/auth_local_data_source.dart'
    as _i3;
import 'package:shopping_app/data/auth/source/remote/auth_remote.dart' as _i4;
import 'package:shopping_app/data/home/repository/home_repository_impl.dart'
    as _i12;
import 'package:shopping_app/data/home/source/home_remote.dart' as _i10;
import 'package:shopping_app/domain/auth/repository/auth_repository.dart'
    as _i5;
import 'package:shopping_app/domain/auth/usecase/first_time_usecase.dart'
    as _i8;
import 'package:shopping_app/domain/auth/usecase/get_userdata_usecase.dart'
    as _i9;
import 'package:shopping_app/domain/auth/usecase/login_from_memory_usecase.dart'
    as _i13;
import 'package:shopping_app/domain/auth/usecase/login_use_case.dart' as _i14;
import 'package:shopping_app/domain/auth/usecase/logout_usecase.dart' as _i15;
import 'package:shopping_app/domain/auth/usecase/sign_up_usecase.dart' as _i16;
import 'package:shopping_app/domain/auth/usecase/update_user_usecase.dart'
    as _i17;
import 'package:shopping_app/domain/home/repository/home_repository.dart'
    as _i11;
import 'package:shopping_app/domain/home/usecases/get_items_usecase.dart'
    as _i19;
import 'package:shopping_app/injectable_module.dart' as _i26;
import 'package:shopping_app/presentation/auth/bloc/get_profile_bloc/get_profile_bloc.dart'
    as _i20;
import 'package:shopping_app/presentation/auth/bloc/sign_in_bloc/sign_in_bloc.dart'
    as _i21;
import 'package:shopping_app/presentation/auth/bloc/sign_in_memory_bloc/sign_in_from_memory_bloc.dart'
    as _i22;
import 'package:shopping_app/presentation/auth/bloc/sign_up_bloc/sign_up_bloc.dart'
    as _i23;
import 'package:shopping_app/presentation/auth/bloc/update_photo_bloc/update_photo_bloc.dart'
    as _i24;
import 'package:shopping_app/presentation/core/bloc/auth_bloc.dart' as _i18;
import 'package:shopping_app/presentation/home/bloc/get_items_bloc/get_items_bloc.dart'
    as _i25;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.singleton<_i3.AuthLocalDataSource>(_i3.AuthLocalDataSource());
  gh.singleton<_i4.AuthRemote>(_i4.AuthRemote());
  gh.singleton<_i5.AuthRepository>(_i6.AuthRepositoryImpl(
    gh<_i3.AuthLocalDataSource>(),
    gh<_i4.AuthRemote>(),
  ));
  await gh.lazySingletonAsync<_i7.FirebaseApp>(
    () => injectableModule.firebaseApp,
    preResolve: true,
  );
  gh.singleton<_i8.FirstTimeUseCase>(
      _i8.FirstTimeUseCase(gh<_i5.AuthRepository>()));
  gh.singleton<_i9.GetUserDataUseCase>(
      _i9.GetUserDataUseCase(gh<_i5.AuthRepository>()));
  gh.singleton<_i10.HomeRemote>(_i10.HomeRemote());
  gh.singleton<_i11.HomeRepository>(
      _i12.HomeRepositoryImpl(gh<_i10.HomeRemote>()));
  gh.singleton<_i13.LoginFromMemoryUseCase>(
      _i13.LoginFromMemoryUseCase(gh<_i5.AuthRepository>()));
  gh.singleton<_i14.LoginUseCase>(_i14.LoginUseCase(gh<_i5.AuthRepository>()));
  gh.singleton<_i15.Logout>(_i15.Logout(gh<_i5.AuthRepository>()));
  gh.singleton<_i16.SignUpUseCase>(
      _i16.SignUpUseCase(gh<_i5.AuthRepository>()));
  gh.singleton<_i17.UpdateUserUseCase>(
      _i17.UpdateUserUseCase(gh<_i5.AuthRepository>()));
  gh.singleton<_i18.AuthBloc>(_i18.AuthBloc(
    gh<_i8.FirstTimeUseCase>(),
    gh<_i13.LoginFromMemoryUseCase>(),
  ));
  gh.singleton<_i19.GetItemsUseCase>(
      _i19.GetItemsUseCase(gh<_i11.HomeRepository>()));
  gh.factory<_i20.GetProfileBloc>(
      () => _i20.GetProfileBloc(gh<_i9.GetUserDataUseCase>()));
  gh.factory<_i21.SignInBloc>(() => _i21.SignInBloc(
        gh<_i14.LoginUseCase>(),
        gh<_i18.AuthBloc>(),
      ));
  gh.factory<_i22.SignInFromMemoryBloc>(() => _i22.SignInFromMemoryBloc(
        gh<_i13.LoginFromMemoryUseCase>(),
        gh<_i18.AuthBloc>(),
      ));
  gh.factory<_i23.SignUpBloc>(() => _i23.SignUpBloc(
        gh<_i16.SignUpUseCase>(),
        gh<_i18.AuthBloc>(),
      ));
  gh.factory<_i24.UpdatePhotoBloc>(
      () => _i24.UpdatePhotoBloc(gh<_i17.UpdateUserUseCase>()));
  gh.factory<_i25.GetItemsBloc>(
      () => _i25.GetItemsBloc(gh<_i19.GetItemsUseCase>()));
  return getIt;
}

class _$InjectableModule extends _i26.InjectableModule {}
