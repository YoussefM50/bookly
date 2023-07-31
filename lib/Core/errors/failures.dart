import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServiceFailure extends Failure {
  ServiceFailure(super.errorMessage);

  factory ServiceFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure('Connection timeout with Api Service');
      case DioExceptionType.sendTimeout:
        return ServiceFailure('Send timeout with Api Service');
      case DioExceptionType.receiveTimeout:
        return ServiceFailure('Receive timeout with Api Service');
      case DioExceptionType.badCertificate:
        return ServiceFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.badResponse:
        return ServiceFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServiceFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          return ServiceFailure('No Internet Connection');
        }
        return ServiceFailure('Unexpected Error, Please try again!');
      case DioExceptionType.unknown:
        return ServiceFailure('Unknown Error, Please try again!');
      default:
        return ServiceFailure(
            'Opps, there was an error, Please try again later!');
    }
  }

  factory ServiceFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServiceFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServiceFailure(
          'Your request is not found, Please try again later!');
    } else if (statusCode == 500) {
      return ServiceFailure('Internal server error, Please try again later!');
    } else {
      ServiceFailure('Opps, there was an error, Please try again later!');
    }
    throw UnimplementedError();
  }
}
