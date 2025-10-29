class UserLocalModel {
  final String? id;
  final String? name;
  final String? phone;
  final String? cityId;
  final String? avatar;
  final String? accessToken;

  UserLocalModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.cityId,
    required this.avatar,
    required this.accessToken,
  });
  factory UserLocalModel.fromMap(Map<String, dynamic> map) {
    return UserLocalModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      cityId: map['cityId'],
      avatar: map['avatar'],
      accessToken: map['accessToken'],
    );
  }
}
