import 'package:relaxio/core/models/user_local_model.dart';

class UserDataService {
  UserDataService._();

  static String? accessToken;
  static String? userID;
  static String? userName;
  static String? userPhone;
  static String? userCityId;
  static String? userAvater;

  static void setUserData(UserLocalModel userLocalModel) {
    accessToken = userLocalModel.accessToken;
    userID = userLocalModel.id;
    userName = userLocalModel.name;
    userPhone = userLocalModel.phone;
    userCityId = userLocalModel.cityId;
    userAvater = userLocalModel.avatar;
  }

  static dispose() async {
    accessToken = null;
    userID = null;
    userName = null;
    userPhone = null;
    userCityId = null;
    userAvater = null;
  }
}
