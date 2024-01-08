import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/auth_login_req.dart';
import '../../../domain/repository/auth_repository.dart';

part 'login_bloc_state.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {

  final AuthRepository authRepository;

  LoginBlocCubit(this.authRepository) : super(LoginBlocInitial());

  Future<void> login(String username, String password) async {
    emit(LoginLoading());

    final result = await authRepository
        .login(AuthLoginReq(userName: username, password: password));

    result.fold(
          (failure) => emit(LoginError(failure.message)),
          (user) => emit(LoginSuccess()),
    );
  }
}
