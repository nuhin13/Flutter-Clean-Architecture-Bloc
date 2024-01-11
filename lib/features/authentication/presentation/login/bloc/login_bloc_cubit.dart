import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/auth_login_req.dart';
import '../../../domain/usecase/auth_use_case.dart';

part 'login_bloc_state.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {

  final AuthUseCase authUseCase;

  LoginBlocCubit(this.authUseCase) : super(LoginBlocInitial());

  Future<void> login(String username, String password) async {
    var validity = await _checkingValidations(username, password);
    if(!validity) return;

    final result = await authUseCase
        .doLogin(AuthLoginReq(userName: username, password: password));

    result.fold(
          (failure) => emit(LoginError(failure.message)),
          (user) {
            user ? emit(LoginSuccess()) : emit(const LoginError('Login failed'));
          },
    );
  }

  Future<bool> _checkingValidations(String username, String password) async {
    if (username.isEmpty) {
      emit(const LoginError('Username cannot be empty'));
      return false;
    } else if (password.isEmpty) {
      emit(const LoginError('Password cannot be empty'));
      return false;
    } else {
      emit(LoginLoading());
      return true;
    }
  }
}
