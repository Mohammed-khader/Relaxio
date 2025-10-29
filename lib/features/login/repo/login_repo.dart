import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:relaxio/core/api/api_end_point.dart';
import 'package:relaxio/core/api/dio_client.dart';
import 'package:relaxio/core/errors/error_handler.dart';
import 'package:relaxio/core/local/local_storage_service.dart';
import 'package:relaxio/core/models/login_response_model.dart';
import 'package:relaxio/core/models/user_local_model.dart';

class LoginRepo {
  Future<Either<String, LoginResponseModel?>> sendApiRequest({
    required String phone,
    required String password,
  }) async {
    final dio = DioClient.get();

    try {
      final response = await dio.post(ApiEndPoint.apiLogin, data: {
        "phone": phone,
        "password": password,
      });
      log('Request : ${response.realUri}');
      LoginResponseModel? loginResponseModel;
      loginResponseModel = LoginResponseModel.fromJson(response.data);
      final userLocal = UserLocalModel(
        id: loginResponseModel.results?.user?.id.toString(),
        name: loginResponseModel.results?.user?.name,
        phone: loginResponseModel.results?.user?.phone,
        cityId: loginResponseModel.results?.user?.city?.id.toString(),
        avatar: loginResponseModel.results?.user?.avatar,
        accessToken: loginResponseModel.results?.accesstoken,
      );

      await LocalStorageService.instance.setUserData(userLocal);

      log('✅ User data saved locally');

      return Right(loginResponseModel);
    } on Exception catch (e) {
      final error = ErrorHandler.handleError(e);
      log('Error: $error');
      return Left(ErrorHandler.handleError(e));
    }
  }
}
