//class FailuresApp {}

import 'package:dio/dio.dart';

abstract class FailuresApp {
  final String message;

  FailuresApp({required this.message});
}

// clean art : oop :

// حسب نوع الخطا : :
class ServerFailure extends FailuresApp {
  ServerFailure({required super.message});

  // factory constructor :
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      // غير المسج بس :
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "Connection TimeOut");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "Connection TimeOut");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "Connection TimeOut");

      case DioExceptionType.badCertificate:
        return ServerFailure(message: "Connection TimeOut");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(message: "Connection TimeOut");

      case DioExceptionType.connectionError:
        return ServerFailure(message: "Connection TimeOut");

      case DioExceptionType.unknown:
        return ServerFailure(message: "Connection TimeOut");
    }
  }

  //
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
        message: "Your request was not found please try later : ",
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        message: "There is a problem with server , please try later  ",
      );
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      // token error ;

      return ServerFailure(message: response['error']['message']);
    } else {
      return ServerFailure(message: "The was an error , please try again ");
    }
  }
}

// class CacheFailure extends FailuresApp {}

// class NetworkFailure extends FailuresApp {}
