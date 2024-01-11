import 'package:flutter_clean_architecture/features/welcome/domain/repository/welcome_repository.dart';

class WelcomeUseCase {
  WelcomeRepository welcomeRepository;

  WelcomeUseCase(this.welcomeRepository);

  Future<bool> isUserLoggedIn() async {
    return await welcomeRepository.isUserLoggedIn();
  }
}
