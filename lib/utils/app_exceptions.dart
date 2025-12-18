class NetworkException implements Exception {
  final String message;

  NetworkException({this.message = "Network error occurred,"});

  @override
  String toString() => message;
}

class AppException implements Exception {
  final String message;

  AppException(
      {this.message = "Something went wrong, don't worry it's from us"});

  @override
  String toString() => message;
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException({this.message = "Unexpected error occurred"});

  @override
  String toString() => message;
}
