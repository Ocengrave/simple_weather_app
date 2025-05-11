class LocationException implements Exception {
  final String userMessage;
  final String? technicalDetails;

  const LocationException(this.userMessage, {this.technicalDetails});

  @override
  String toString() => userMessage;
}
