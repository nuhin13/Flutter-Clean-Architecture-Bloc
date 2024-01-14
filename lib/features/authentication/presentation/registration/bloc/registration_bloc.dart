import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/auth_reg_req.dart';
import '../../../domain/usecase/auth_use_case.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  AuthUseCase authUseCase;

  RegistrationBloc(this.authUseCase) : super(const RegistrationState()) {
    on<DoRegistration>(_registration);
  }

  _registration(DoRegistration event, Emitter<RegistrationState> emit) {
    authUseCase.doRegister(event.registrationReq);
  }
}
