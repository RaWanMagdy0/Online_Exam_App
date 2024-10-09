// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api/api_manger.dart' as _i3;
import '../../data/contracts/auth/auth_online_data_source.dart' as _i6;
import '../../data/datasource/auth/auth_online_data_source_impl.dart' as _i6;
import '../../data/repository/auth/auth_repository_impl.dart' as _i5;
import '../../domain/repository/auth_repository.dart' as _i4;
import '../../domain/usecase/signup_use_case.dart' as _i7;
import '../../presentation/auth/signup/view_model/signup_cubit.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManger>(() => _i3.ApiManger());
    gh.factory<_i4.AuthRepository>(() => _i5.AuthRepositoryImpl(
        authOnlineDataSource: gh<_i6.AuthOnlineDataSource>()));
    gh.factory<_i7.SignupUseCase>(
        () => _i7.SignupUseCase(authRepository: gh<_i4.AuthRepository>()));
    gh.factory<_i8.SignupCubit>(() => _i8.SignupCubit(gh<_i7.SignupUseCase>()));
    gh.factory<_i6.AuthOnlineDataSource>(
            () => _i6.AuthOnlineDataSourceImpl(gh<_i3.ApiManger>()));
    return this;
  }
}
