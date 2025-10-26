class VerifyOtpResponseModel {
  final bool? success;
  final Results? results;
  final String? error;

  VerifyOtpResponseModel({this.success, this.results, this.error});

  VerifyOtpResponseModel.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        results =
            json['results'] != null ? Results.fromJson(json['results']) : null,
        error = json['error'];
}

class Results {
  final String? accessToken;
  final String? tokenType;
  final User? user;

  Results({this.accessToken, this.tokenType, this.user});

  Results.fromJson(Map<String, dynamic> json)
      : accessToken = json['access_token'],
        tokenType = json['token_type'],
        user = json['user'] != null ? User.fromJson(json['user']) : null;
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final City? city;
  final String? avatar;
  final String? role;
  final bool? isFarmOwner;
  final Verifications? verifications;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.city,
    this.avatar,
    this.role,
    this.isFarmOwner,
    this.verifications,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        city = json['city'] != null ? City.fromJson(json['city']) : null,
        avatar = json['avatar'],
        role = json['role'],
        isFarmOwner = json['is_farm_owner'],
        verifications = json['verifications'] != null
            ? Verifications.fromJson(json['verifications'])
            : null,
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}

class City {
  final int? id;
  final String? nameAr;
  final String? nameEn;

  City({this.id, this.nameAr, this.nameEn});

  City.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nameAr = json['name_ar'],
        nameEn = json['name_en'];
}

class Verifications {
  final bool? isFarmOwner;

  Verifications({this.isFarmOwner});

  Verifications.fromJson(Map<String, dynamic> json)
      : isFarmOwner = json['is_farm_owner'];
}
