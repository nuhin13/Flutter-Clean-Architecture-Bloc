class ApiClientConfig {
  final String baseUrl;
  final String apiVersion;
  final bool isDebug;

  ApiClientConfig(
      {required this.baseUrl, required this.isDebug, required this.apiVersion});

  bool get isNotDebug {
    return !isDebug;
  }
}
