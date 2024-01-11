part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final RegistrationStatus status;

  RegistrationState copyWith({
    RegistrationStatus? status,
  }) {
    return RegistrationState(
      status: status ?? this.status,
    );
  }

  const RegistrationState({
    this.status = RegistrationStatus.initial,
  });

  @override
  List<Object?> get props => [
        status,
      ];
}

enum RegistrationStatus {
  initial,
  success,
  error,
}
