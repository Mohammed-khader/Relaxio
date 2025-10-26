class LoginResponseModel {
  final bool? success;
  final Results? results;
  final String? error;

  LoginResponseModel({
    required this.success,
    required this.results,
    required this.error,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginResponseModel(
      success: jsonData['success'] ?? false,
      results: Results.fromJson(jsonData['results'] ?? {}),
      error: jsonData['error'] ?? '',
    );
  }
}

class Results {
  final String? accesstoken;
  final String? tokentype;
  final User? user;

  Results({
    required this.accesstoken,
    required this.tokentype,
    required this.user,
  });
  factory Results.fromJson(Map<String, dynamic> jsonData) {
    return Results(
      accesstoken: jsonData['access_token'] ?? '',
      tokentype: jsonData['token_type'] ?? '',
      user: User.fromJson(jsonData['user'] ?? ''),
    );
  }
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final City? city;
  final String? avatar;
  final String? createdat;
  final String? updatedat;

  User({
    required this.avatar,
    required this.createdat,
    required this.updatedat,
    required this.city,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });
  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
        city: City.fromJson(jsonData['city'] ?? ''),
        id: jsonData['id'] ?? '',
        name: jsonData['name'] ?? '',
        email: jsonData['email'] ?? '',
        phone: jsonData['phone'] ?? '',
        avatar: jsonData['avatar'] ?? '',
        createdat: jsonData['created_at'] ?? '',
        updatedat: jsonData['updated_at'] ?? '');
  }
}

class City {
  final int? id;
  final String? namear;
  final String? nameen;

  City({required this.id, required this.namear, required this.nameen});
  factory City.fromJson(Map<String, dynamic> jsonData) {
    return City(
        id: jsonData['id'] ?? '',
        namear: jsonData['name_ar'] ?? '',
        nameen: jsonData['name_en'] ?? '');
  }
}
