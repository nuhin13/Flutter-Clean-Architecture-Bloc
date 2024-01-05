import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_bloc_state.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  LoginBlocCubit() : super(LoginBlocInitial());
}
