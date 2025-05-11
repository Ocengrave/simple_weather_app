class WeatherException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic responseData;
  final Exception? prevoius;
  final bool isNetworkError;

  WeatherException(
    this.message, {
    this.statusCode,
    this.responseData,
    this.prevoius,
    this.isNetworkError = false,
  });

  @override
  String toString() => message;
}
