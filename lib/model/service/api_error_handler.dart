import 'dart:developer';
import 'package:dio/dio.dart';
class ApiErrorHandler{

  static dynamic getErrorMessage(error){
    dynamic errorDescription='';
    if(error is Exception){
      log('=======>Exception');
      try{
        if(error is DioException){
          log('This is an DioException');
          log('Check Error :${error.type}');
          switch(error.type){

            case DioExceptionType.connectionTimeout:
              errorDescription='Connection timeout';
              break;
            case DioExceptionType.sendTimeout:
              errorDescription='Send TimeOut';
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription='receiveTimeout';
              break;
            case DioExceptionType.badCertificate:
              errorDescription='badCertificate';
              break;
            case DioExceptionType.badResponse:
              errorDescription='badResponse';
              break;
            case DioExceptionType.cancel:
              errorDescription='cancel';
              break;
            case DioExceptionType.connectionError:
              errorDescription='connectionError';
              break;
            case DioExceptionType.unknown:
              errorDescription='unknown';
              break;
          }
        }else{
          errorDescription='Unexpected Error occurred';
        }

      }on FormatException catch(_){
        errorDescription ='$_ Format Exception';
      }
    }
    else{
      errorDescription='is Not a Subtype of Error';
    }
 return errorDescription;
  }


}

