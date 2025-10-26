class SignUpResponseModel {
  final bool success;
  final Results results;
  final String? error;

  SignUpResponseModel({
    required this.success,
    required this.results,
    required this.error,
  });
  factory SignUpResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpResponseModel(
        success: jsonData['success'] ?? false,
        results: Results.fromJson(jsonData['results'] ?? {}),
        error: jsonData['error'] ?? '');
  }
}

class Results {
  final String message;
  final String securityToken;
  final String expiresIn;

  Results({
    required this.message,
    required this.securityToken,
    required this.expiresIn,
  });
  factory Results.fromJson(Map<String, dynamic> jsonData) {
    return Results(
      message: jsonData['message'] ?? '',
      securityToken: jsonData['security_token'] ?? '',
      expiresIn: jsonData['expires_in'] ?? '',
    );
  }
}
