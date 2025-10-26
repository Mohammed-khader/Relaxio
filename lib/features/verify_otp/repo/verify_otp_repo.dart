import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:relaxio/core/api/api_end_point.dart';
import 'package:relaxio/core/api/dio_client.dart';
import 'package:relaxio/core/errors/error_handler.dart';
import 'package:relaxio/core/models/verify_otp_response_model.dart';

class VerifyOtpRepo {
  Future<Either<String, VerifyOtpResponseModel>> sendVerifyOtp(
      {required String phone,
      required String otp,
      required String securityToken}) async {
    final dio = DioClient.get();
    try {
      final response = await dio.post(ApiEndPoint.apiVerifyOtp, data: {
        "phone": phone,
        "otp": otp,
        "security_token": securityToken,
      });
      VerifyOtpResponseModel? verifyOtpResponseModel;
      verifyOtpResponseModel = VerifyOtpResponseModel.fromJson(response.data);
      return Right(verifyOtpResponseModel);
    } on Exception catch (e) {
      final error = ErrorHandler.handleError(e);
      log('error: $error');
      return Left(ErrorHandler.handleError(e));
    }
  }
}
