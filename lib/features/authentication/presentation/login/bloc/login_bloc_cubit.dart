import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/auth_login_req.dart';
import '../../../domain/usecase/auth_use_case.dart';

part 'login_bloc_state.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {

  final AuthUseCase authUseCase;

  LoginBlocCubit(this.authUseCase) : super(LoginBlocInitial());

  Future<void> login(String username, String password) async {
    emit(LoginLoading());

    final result = await authUseCase
        .doLogin(AuthLoginReq(userName: username, password: password));

    result.fold(
          (failure) => emit(LoginError(failure.message)),
          (user) {
            user ? emit(LoginSuccess()) : emit(const LoginError('Login failed'));
          },
    );
  }
}
