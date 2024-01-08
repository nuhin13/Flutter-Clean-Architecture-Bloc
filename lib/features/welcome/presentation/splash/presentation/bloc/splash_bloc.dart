import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/features/welcome/domain/repository/welcome_repository.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final WelcomeRepository welcomeRepository;

  SplashBloc(this.welcomeRepository) : super(SplashInitial()) {
    on<SplashNavigate>(_checkNavigation);
  }

  _checkNavigation(SplashEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    //Future.delayed(const Duration(seconds: 2));

    bool login = await welcomeRepository.isUserLoggedIn();

    if (login) {
      emit(SplashToDashboard());
      return;
    }

    emit(SplashToLogin());
  }
}
