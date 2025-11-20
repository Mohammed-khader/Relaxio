import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class ErrorHandler {
  static String handleError(Object error) {
    if (error is DioException) {
      if (error.response != null) {
        final data = error.response!.data;

        if (data is Map<String, dynamic>) {
          if (data['error'] != null) return data['error'];
          if (data['message'] != null) return data['message'];
          if (data['errors'] != null) return data['errors'].toString();
        }
      }

      return _handleDioException(error);
    }

    if (error is FormatException) return 'Format Error';
    if (error is SocketException) return 'Network Error';
    if (error is TimeoutException) return 'Timeout Error';

    return 'Something Went Wrong';
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
