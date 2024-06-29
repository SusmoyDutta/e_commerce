class NetworkResponse {
  final int? responseCode;
  final bool isSuccess;
  final String? errorMessage;
  final dynamic responseData;

  NetworkResponse({
    required this.responseCode,
    required this.isSuccess,
    this.responseData,
    this.errorMessage ='',
  });
}
