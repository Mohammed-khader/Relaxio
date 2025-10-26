import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:relaxio/core/api/api_end_point.dart';
import 'package:relaxio/core/api/dio_client.dart';
import 'package:relaxio/core/errors/error_handler.dart';
import 'package:relaxio/core/models/sign_up_response_model.dart';

class SignUpRepo {
  Future<Either<String, SignUpResponseModel>> sendSignUpRequest(
      {required String name,
      required String phone,
      required String cityId,
      required String password,
      required String confermPasswoed}) async {
    final dio = DioClient.get();

    try {
      final response = await dio.post(
        ApiEndPoint.apiSignUp,
        data: {
          "name": name,
          "phone": phone,
          "city_id": cityId,
          "password": password,
          "password_confirmation": confermPasswoed
        },
      );
      log('Request : ${response.realUri}');
      SignUpResponseModel? signUpResponseModel;
      signUpResponseModel = SignUpResponseModel.fromJson(response.data);
      return Right(signUpResponseModel);
    } on Exception catch (e) {
      final error = ErrorHandler.handleError(e);
      log('Error: $error');
      return Left(ErrorHandler.handleError(e));
    }
  }
}
