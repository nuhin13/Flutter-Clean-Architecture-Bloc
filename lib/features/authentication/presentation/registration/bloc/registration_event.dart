part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class DoRegistration extends RegistrationEvent {
  final AuthRegistrationReq registrationReq;

  const DoRegistration({required this.registrationReq});

  @override
  List<Object> get props => [registrationReq];
}
