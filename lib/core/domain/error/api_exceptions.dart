class RepositoryUnavailableException implements Exception {
  RepositoryUnavailableException([var message]);
}

class ApiException implements Exception {
  final int code;
  final String message;

  ApiException(this.code, this.message);
}

class RepositoryValidationException extends ApiException {
  RepositoryValidationException(message) : super(406, message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(message) : super(401, message);
}

class DeviceAlreadySubscribedException extends RepositoryValidationException {
  DeviceAlreadySubscribedException(message) : super(message);
}

class ContextException implements Exception {
  final String message;

  ContextException(this.message);
}
