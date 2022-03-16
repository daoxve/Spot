class NetworkException implements Exception {
  NetworkException({
    required this.message,
    this.devDetails,
    this.prettyDetails,
  });

  final String message;
  final String? devDetails;
  final String? prettyDetails;

  @override
  String toString() {
    return 'Network Exception: $message ${devDetails != null ? '- $devDetails' : ''}';
  }
}
