class Resource<T> {
  ResourceStatus status;
  T? response;
  String? message;
  String? stackTrace;
  int? messageCode;
  bool? isReadOnly;

  Resource(
      {this.response,
        this.message,
        this.status = ResourceStatus.success,
        this.stackTrace,
        this.isReadOnly,
        this.messageCode = 0});

  factory Resource.fromApiResponse(dynamic response) {
    return Resource(
      // response: response['data'],
      response: response,
      message: response['message'],
      messageCode: response['messageCode'],
      isReadOnly: response['isReadOnly'],
      status: ResourceStatus.success,
    );
  }

  update(Resource resource) {
    this.message = resource.message;
    this.status = resource.status;
    this.stackTrace = resource.stackTrace;
    this.messageCode = resource.messageCode;
    this.isReadOnly = resource.isReadOnly;
  }
}

enum ResourceStatus {
  empty,
  loading,
  success, // When response.isSuccess = TRUE
  failed, // When response.isSuccess = FALSE
  noInternet
}
