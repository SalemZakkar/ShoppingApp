// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_core/firebase_core.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shopping_app_dashboard/data/auth/repository/auth_repository_impl.dart'
    as _i7;
import 'package:shopping_app_dashboard/data/auth/source/local/auth_local_storage.dart'
    as _i3;
import 'package:shopping_app_dashboard/data/auth/source/remote/auth_remote.dart'
    as _i4;
import 'package:shopping_app_dashboard/data/auth/source/remote/auth_remote_impl.dart'
    as _i5;
import 'package:shopping_app_dashboard/domain/auth/repository/auth_repository.dart'
    as _i6;
import 'package:shopping_app_dashboard/domain/auth/usecases/auto_login_usecase.dart'
    as _i8;
import 'package:shopping_app_dashboard/domain/auth/usecases/get_user_data_usecase.dart'
    as _i10;
import 'package:shopping_app_dashboard/domain/auth/usecases/login_usecase.dart'
    as _i12;
import 'package:shopping_app_dashboard/domain/auth/usecases/logout_usecase.dart'
    as _i11;
import 'package:shopping_app_dashboard/injectable_module.dart' as _i16;
import 'package:shopping_app_dashboard/presentation/auth/bloc/profile_bloc/profile_bloc.dart'
    as _i13;
import 'package:shopping_app_dashboard/presentation/auth/bloc/sign_in_bloc/sign_in_bloc.dart'
    as _i14;
import 'package:shopping_app_dashboard/presentation/splash/bloc/auto_login_bloc.dart'
    as _i15;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
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
  gh.singleton<_i4.AuthRemote>(_i5.AuthRemoteImpl());
  gh.singleton<_i6.AuthRepository>(_i7.AuthRepositoryImpl(
    gh<_i4.AuthRemote>(),
    gh<_i3.AuthLocalDataSource>(),
  ));
  gh.factory<_i8.AutoLoginUseCase>(
      () => _i8.AutoLoginUseCase(gh<_i6.AuthRepository>()));
  await gh.lazySingletonAsync<_i9.FirebaseApp>(
    () => injectableModule.firebaseApp,
    preResolve: true,
  );
  gh.factory<_i10.GetUserDataUseCase>(
      () => _i10.GetUserDataUseCase(gh<_i6.AuthRepository>()));
  gh.factory<_i11.LogOutUseCase>(
      () => _i11.LogOutUseCase(gh<_i6.AuthRepository>()));
  gh.factory<_i12.LoginUseCase>(
      () => _i12.LoginUseCase(gh<_i6.AuthRepository>()));
  gh.factory<_i13.ProfileBloc>(
      () => _i13.ProfileBloc(gh<_i10.GetUserDataUseCase>()));
  gh.factory<_i14.SignInBloc>(() => _i14.SignInBloc(gh<_i12.LoginUseCase>()));
  gh.factory<_i15.AutoLoginBloc>(
      () => _i15.AutoLoginBloc(gh<_i8.AutoLoginUseCase>()));
  return getIt;
}

class _$InjectableModule extends _i16.InjectableModule {}
