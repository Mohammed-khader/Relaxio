import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:relaxio/core/local/user_data.dart';
import 'package:relaxio/core/models/user_local_model.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static FlutterSecureStorage? _storage;

  static LocalStorageService get instance {
    if (_instance == null) {
      LocalStorageService._init();
    }
    return _instance!;
  }

  LocalStorageService._init() {
    _instance = this;
    _storage = const FlutterSecureStorage();
  }
  Future<void> setAccessToken(String accessToken) async {
    await _storage?.write(key: 'access_token', value: accessToken);
    log('AccessToken: $accessToken save success');
  }

  Future<String?> getAccessToken() async {
    return await _storage?.read(key: 'access_token');
  }

  Future<void> setUserId(String userID) async {
    await _storage?.write(key: 'id', value: userID);
  }

  Future<String?> getUserId() async {
    return _storage?.read(key: 'id');
  }

  Future<void> setUserName(String userName) async {
    await _storage?.write(key: 'name', value: userName);
  }

  Future<String?> getUserName() async {
    return _storage?.read(key: 'name');
  }

  Future<void> setUserPhone(String userPhone) async {
    await _storage?.write(key: 'phone', value: userPhone);
  }

  Future<String?> getUserPhone() async {
    return _storage?.read(key: 'phone');
  }

  Future<void> setUserCityId(String userCityId) async {
    await _storage?.write(key: 'cityId', value: userCityId);
  }

  Future<String?> getUserCityId() async {
    return _storage?.read(key: 'cityId');
  }

  Future<void> setUserAvatar(String userAvatar) async {
    await _storage?.write(key: 'avatar', value: userAvatar);
  }

  Future<String?> getUserAvatar() async {
    return _storage?.read(key: 'avatar');
  }

  Future<void> removeAll() async {
    await _storage?.deleteAll();
  }

  Future<void> setUserData(UserLocalModel? userLocalModel) async {
    if (userLocalModel != null) {
      UserDataService.setUserData(userLocalModel);
    }
    await setAccessToken(userLocalModel?.accessToken ?? '');
    await setUserId(userLocalModel?.id ?? '');
    await setUserName(userLocalModel?.name ?? '');
    await setUserPhone(userLocalModel?.phone ?? '');
    await setUserCityId(userLocalModel?.cityId ?? '');
    await setUserAvatar(userLocalModel?.avatar ?? '');

    await setUserIsLogin(true);
  }

  Future<UserLocalModel?> getUserData() async {
    final accessToken = await getAccessToken();
    if (accessToken == null) return null;

    final userID = await getUserId();
    final userName = await getUserName();
    final userPhone = await getUserPhone();
    final userCityId = await getUserCityId();
    final userAvatar = await getUserAvatar();

    return UserLocalModel(
      accessToken: accessToken,
      id: userID,
      name: userName,
      phone: userPhone,
      cityId: userCityId,
      avatar: userAvatar,
    );
  }

  Future<void> setUserIsLogin(bool isLogin) async {
    await _storage?.write(key: 'userIsLogin', value: isLogin.toString());
  }

  Future<bool> getUserIsLogin() async {
    final isLoginFromStorage = await _storage?.read(key: 'userIsLogin');
    if (isLoginFromStorage != null && isLoginFromStorage == 'true') {
      return true;
    } else {
      return false;
    }
  }
}
