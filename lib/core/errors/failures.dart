import 'dart:io';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioErrorType.badResponse:
        final response = dioError.response;
        if (response != null) {
          return ServerFailure.fromResponse(response.statusCode, response.data);
        } else {
          return ServerFailure('No response received from server');
        }
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioErrorType.unknown:
        if (dioError.error is SocketException) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Oops! There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response is Map<String, dynamic> &&
          response['error'] is Map<String, dynamic> &&
          response['error']['message'] is String) {
        return ServerFailure(response['error']['message']);
      } else {
        return ServerFailure('Authentication Error');
      }
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Oops! There was an Error, Please try again');
    }
  }
}
