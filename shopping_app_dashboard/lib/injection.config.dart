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
import 'package:shopping_app_dashboard/data/items/repository/items_repository_impl.dart'
    as _i13;
import 'package:shopping_app_dashboard/data/items/source/item_remote.dart'
    as _i11;
import 'package:shopping_app_dashboard/domain/auth/repository/auth_repository.dart'
    as _i6;
import 'package:shopping_app_dashboard/domain/auth/usecases/auto_login_usecase.dart'
    as _i8;
import 'package:shopping_app_dashboard/domain/auth/usecases/get_user_data_usecase.dart'
    as _i10;
import 'package:shopping_app_dashboard/domain/auth/usecases/login_usecase.dart'
    as _i15;
import 'package:shopping_app_dashboard/domain/auth/usecases/logout_usecase.dart'
    as _i14;
import 'package:shopping_app_dashboard/domain/items/repository/item_repository.dart'
    as _i12;
import 'package:shopping_app_dashboard/domain/items/usecases/add_item_usecase.dart'
    as _i19;
import 'package:shopping_app_dashboard/domain/items/usecases/delete_item_usecase.dart'
    as _i21;
import 'package:shopping_app_dashboard/domain/items/usecases/get_items_usecase.dart'
    as _i22;
import 'package:shopping_app_dashboard/domain/items/usecases/update_item_usecase.dart'
    as _i18;
import 'package:shopping_app_dashboard/injectable_module.dart' as _i27;
import 'package:shopping_app_dashboard/presentation/auth/bloc/profile_bloc/profile_bloc.dart'
    as _i16;
import 'package:shopping_app_dashboard/presentation/auth/bloc/sign_in_bloc/sign_in_bloc.dart'
    as _i17;
import 'package:shopping_app_dashboard/presentation/items/bloc/add_item_bloc/add_item_bloc.dart'
    as _i24;
import 'package:shopping_app_dashboard/presentation/items/bloc/del_item_bloc/del_item_bloc.dart'
    as _i25;
import 'package:shopping_app_dashboard/presentation/items/bloc/edit_item_bloc/edit_item_bloc.dart'
    as _i26;
import 'package:shopping_app_dashboard/presentation/items/bloc/get_item_bloc/get_item_bloc.dart'
    as _i23;
import 'package:shopping_app_dashboard/presentation/splash/bloc/auto_login_bloc.dart'
    as _i20;

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
  gh.singleton<_i11.ItemRemote>(_i11.ItemRemote());
  gh.singleton<_i12.ItemRepository>(
      _i13.ItemRepositoryImpl(gh<_i11.ItemRemote>()));
  gh.factory<_i14.LogOutUseCase>(
      () => _i14.LogOutUseCase(gh<_i6.AuthRepository>()));
  gh.factory<_i15.LoginUseCase>(
      () => _i15.LoginUseCase(gh<_i6.AuthRepository>()));
  gh.factory<_i16.ProfileBloc>(
      () => _i16.ProfileBloc(gh<_i10.GetUserDataUseCase>()));
  gh.factory<_i17.SignInBloc>(() => _i17.SignInBloc(gh<_i15.LoginUseCase>()));
  gh.factory<_i18.UpdateItemUseCase>(
      () => _i18.UpdateItemUseCase(gh<_i12.ItemRepository>()));
  gh.factory<_i19.AddItemUseCase>(
      () => _i19.AddItemUseCase(gh<_i12.ItemRepository>()));
  gh.factory<_i20.AutoLoginBloc>(
      () => _i20.AutoLoginBloc(gh<_i8.AutoLoginUseCase>()));
  gh.factory<_i21.DeleteItemUseCase>(
      () => _i21.DeleteItemUseCase(gh<_i12.ItemRepository>()));
  gh.factory<_i22.GetItemsUseCase>(
      () => _i22.GetItemsUseCase(gh<_i12.ItemRepository>()));
  gh.singleton<_i23.GetItemsBloc>(
      _i23.GetItemsBloc(gh<_i22.GetItemsUseCase>()));
  gh.factory<_i24.AddItemBloc>(() => _i24.AddItemBloc(
        gh<_i19.AddItemUseCase>(),
        gh<_i23.GetItemsBloc>(),
      ));
  gh.factory<_i25.DelItemBloc>(() => _i25.DelItemBloc(
        gh<_i21.DeleteItemUseCase>(),
        gh<_i23.GetItemsBloc>(),
      ));
  gh.factory<_i26.EditItemBloc>(() => _i26.EditItemBloc(
        gh<_i23.GetItemsBloc>(),
        gh<_i18.UpdateItemUseCase>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i27.InjectableModule {}
