// import 'package:dio/dio.dart';
//
// class ApiResponse{
//   final Response? response;
//   final dynamic error;
//   ApiResponse(this.response,this.error);
//   ApiResponse.withError(dynamic errorValue):response=null,error=errorValue;
//   ApiResponse.withSuccess(Response responseValue):response=responseValue,error=null;
//
//
// }
import 'package:dio/dio.dart';

class ApiResponse{
  final Response? response;
  final dynamic error;
  ApiResponse(this.response,this.error);
  ApiResponse.withSuccess(Response responseValue):response=responseValue,error=null;
  ApiResponse.withError(dynamic errorV):error=errorV,response=null;
}