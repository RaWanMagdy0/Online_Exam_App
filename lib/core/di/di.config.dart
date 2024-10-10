// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api/api_consumer.dart' as _i3;
import '../../data/api/api_manger.dart' as _i4;
import '../../data/contracts/auth/auth_online_data_source.dart' as _i5;
import '../../data/datasource/auth/auth_online_data_source_impl.dart' as _i6;
import '../../data/repository/auth/auth_repository_impl.dart' as _i8;
import '../../domain/repository/auth_repository.dart' as _i7;
import '../../domain/usecase/forget_password_use_case.dart' as _i9;
import '../../domain/usecase/login_use_case.dart' as _i10;
import '../../domain/usecase/reset_password_use_case.dart' as _i11;
import '../../domain/usecase/signup_use_case.dart' as _i12;
import '../../domain/usecase/verify_reset_code_use_case.dart' as _i13;
import '../../presentation/auth/forget_password/view_model/forget_password_cubit.dart'
    as _i14;
import '../../presentation/auth/login/view_model/login_cubit.dart' as _i15;
import '../../presentation/auth/signup/view_model/signup_cubit.dart' as _i16;

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
    gh.factory<_i3.ApiConsumer>(() => _i4.DioConsumer());
    gh.factory<_i5.AuthOnlineDataSource>(
        () => _i6.AuthOnlineDataSourceImpl(gh<_i3.ApiConsumer>()));
    gh.factory<_i7.AuthRepository>(() => _i8.AuthRepositoryImpl(
        authOnlineDataSource: gh<_i5.AuthOnlineDataSource>()));
    gh.factory<_i9.ForgetPasswordUseCase>(
        () => _i9.ForgetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i10.LoginUseCase>(
        () => _i10.LoginUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i11.ResetPasswordUseCase>(
        () => _i11.ResetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i12.SignupUseCase>(
        () => _i12.SignupUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.factory<_i13.VerifyResetCodeUseCase>(() =>
        _i13.VerifyResetCodeUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.factory<_i14.ForgetPasswordCubit>(() => _i14.ForgetPasswordCubit(
          gh<_i9.ForgetPasswordUseCase>(),
          gh<_i13.VerifyResetCodeUseCase>(),
          gh<_i11.ResetPasswordUseCase>(),
        ));
    gh.factory<_i15.LoginCubit>(() => _i15.LoginCubit(gh<_i10.LoginUseCase>()));
    gh.factory<_i16.SignupCubit>(
        () => _i16.SignupCubit(gh<_i12.SignupUseCase>()));
    return this;
  }
}
