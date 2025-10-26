import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:relaxio/core/api/api_end_point.dart';
import 'package:relaxio/core/api/dio_client.dart';
import 'package:relaxio/core/errors/error_handler.dart';
import 'package:relaxio/core/models/farm_model.dart';

class HomeRepo {
  final _dio = DioClient.get();
  

  Future<Either<String, FarmsResponseModel>> getAllFarms() async {
    try {
      final response = await _dio.get(ApiEndPoint.apiHome);

      log("✅ Request URL: ${response.statusMessage}");

      final farmsResponse = FarmsResponseModel.fromJson(response.data);
      return Right(farmsResponse);
    } on Exception catch (e) {
      final error = ErrorHandler.handleError(e);
      log('error: $error');
      return Left(ErrorHandler.handleError(e));
    }
  }
}
