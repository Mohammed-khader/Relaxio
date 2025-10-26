import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class ErrorHandler {
  static String handleError(Object error) {
    if (error is DioException) {
      if (error.response != null &&
          error.response?.data != null &&
          error.response?.data is Map<String, dynamic> &&
          error.response?.data['error'] != null) {
        return error.response?.data['error'];
      } else {
        return _handleDioException(error);
      }
    } else if (error is FormatException) {
      return 'Format Error';
    } else if (error is SocketException) {
      return 'Network Error';
    } else if (error is TimeoutException) {
      return 'Timeout Error';
    } else {
      return 'Somthing Went Wrong';
    }
  }

  static String _handleDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection Timeout';
      case DioExceptionType.sendTimeout:
        return 'Send Timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive Timeout';
      case DioExceptionType.badCertificate:
        return 'Bad Certificate';
      case DioExceptionType.badResponse:
        return 'Bad Response';
      case DioExceptionType.cancel:
        return 'Cancel';
      case DioExceptionType.unknown:
        return 'Unknown';
      case DioExceptionType.connectionError:
        return 'Connection Error';
    }
  }
}
