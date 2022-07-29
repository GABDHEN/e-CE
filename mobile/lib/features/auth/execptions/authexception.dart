class AuthException implements Exception {
  final String errorMessage;

  AuthException({required this.errorMessage});
  @override
  String toString() => errorMessage;
}
