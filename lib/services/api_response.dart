abstract class ApiResponse<T> {}

class SuccessApiResponse<T> extends ApiResponse<T> {
  final T data;
  dynamic responseHeaders;
  SuccessApiResponse(this.data, {this.responseHeaders});
}

class ErrorApiResponse<T> extends ApiResponse<T> {
  final String message;
  final int statusCode;
  ErrorApiResponse(this.message, this.statusCode);
}
