part of 'login_bloc_cubit.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();
}

class LoginBlocInitial extends LoginBlocState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginBlocState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginBlocState {
  @override
  List<Object> get props => [];
}

class LoginError extends LoginBlocState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}
