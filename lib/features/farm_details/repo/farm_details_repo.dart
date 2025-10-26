import 'dart:developer';


import 'package:dartz/dartz.dart';
import 'package:relaxio/core/api/api_end_point.dart';
import 'package:relaxio/core/api/dio_client.dart';
import 'package:relaxio/core/errors/error_handler.dart';
import 'package:relaxio/core/models/farm_details_model.dart';

class FarmDetailsRepo {
  final _dio = DioClient.get();
  Future<Either<String, FarmDetailsModel>> getFarmDetails(int farmId) async {
    try {
      final response = await _dio.get("${ApiEndPoint.apiFarmDetails}$farmId");
      log("✅ Request URL: ${response.realUri}");
      if (response.statusCode == 200) {
        final farm = FarmDetailsModel.fromJson(response.data);
        return Right(farm);
      } else {
        return Left('Error ${response.statusCode}');
      }
    } on Exception catch (e) {
      final error = ErrorHandler.handleError(e);
      log('error: $error');
      return Left(ErrorHandler.handleError(e));
    }
  }
}
