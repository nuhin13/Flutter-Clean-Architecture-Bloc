import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/welcome/domain/usecase/welecome_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final WelcomeUseCase welcomeUseCase;

  SplashBloc(this.welcomeUseCase) : super(SplashInitial()) {
    on<SplashNavigate>(_checkNavigation);
  }

  _checkNavigation(SplashEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 2));

    bool login = await welcomeUseCase.isUserLoggedIn();

    if (login) {
      emit(SplashToDashboard());
      return;
    }

    emit(SplashToLogin());
  }
}
