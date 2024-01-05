part of 'login_bloc_cubit.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();
}

class LoginBlocInitial extends LoginBlocState {
  @override
  List<Object> get props => [];
}
