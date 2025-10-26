import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:relaxio/core/api/api_end_point.dart';
import 'package:relaxio/core/api/dio_client.dart';
import 'package:relaxio/core/errors/error_handler.dart';
import 'package:relaxio/core/models/login_response_model.dart';

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

      return Right(loginResponseModel);
    } on Exception catch (e) {
      final error = ErrorHandler.handleError(e);
      log('Error: $error');
      return Left(ErrorHandler.handleError(e));
    }
  }
}
