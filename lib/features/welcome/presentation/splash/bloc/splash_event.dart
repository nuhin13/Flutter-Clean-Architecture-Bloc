part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashNavigate extends SplashEvent {

  const SplashNavigate();

  @override
  List<Object> get props => [];
}